
locals {
  _factory_data_raw = try(merge([
    for f in fileset(var.org_policies_data_path, "**/*.yaml") :
    yamldecode(file("${var.org_policies_data_path}/${f}")).org_policies
  ]...), {})
  _factory_file_raw = try(yamldecode(file("${var.org_policies_file_path}")).org_policies, {})

  # simulate applying defaults to data coming from yaml files
  _factory_data = {
    for k, v in merge(local._factory_data_raw, local._factory_file_raw) :
    k => {
      inherit_from_parent = try(v.inherit_from_parent, null)
      reset               = try(v.reset, null)
      rules = [
        for r in try(v.rules, []) : {
          allow = can(r.allow) ? {
            all    = try(r.allow.all, null)
            values = try(r.allow.values, null)
          } : null
          deny = can(r.deny) ? {
            all    = try(r.deny.all, null)
            values = try(r.deny.values, null)
          } : null
          enforce = try(r.enforce, null)
          condition = {
            description = try(r.condition.description, null)
            expression  = try(r.condition.expression, null)
            location    = try(r.condition.location, null)
            title       = try(r.condition.title, null)
          }
        }
      ]
    }
  }
  # _org_policy_dir = var.org_policy_dir
  _org_policies = merge(local._factory_data, var.org_policies)

  org_policies = {
    for k, v in local._org_policies :
    k => merge(v, {
      name   = "${var.parent}/policies/${k}"
      parent = "${var.parent}"
      is_boolean_policy = (
        alltrue([for r in v.rules : r.allow == null && r.deny == null])
      )
      has_values = (
        length(coalesce(try(v.allow.values, []), [])) > 0 ||
        length(coalesce(try(v.deny.values, []), [])) > 0
      )
      rules = [
        for r in v.rules :
        merge(r, {
          has_values = (
            length(coalesce(try(r.allow.values, []), [])) > 0 ||
            length(coalesce(try(r.deny.values, []), [])) > 0
          )
        })
      ]
    })
  }
}


resource "google_org_policy_policy" "org_policy" {
  for_each = local.org_policies
  name     = each.value.name
  parent   = each.value.parent
  spec {
    inherit_from_parent = each.value.inherit_from_parent
    reset               = each.value.reset
    dynamic "rules" {
      for_each = each.value.rules
      iterator = rule
      content {
        allow_all = try(rule.value.allow.all, false) == true ? "TRUE" : null
        deny_all  = try(rule.value.deny.all, false) == true ? "TRUE" : null
        enforce = (
          each.value.is_boolean_policy && rule.value.enforce != null
          ? upper(tostring(rule.value.enforce))
          : null
        )
        dynamic "condition" {
          for_each = rule.value.condition.expression != null ? [1] : []
          content {
            description = rule.value.condition.description
            expression  = rule.value.condition.expression
            location    = rule.value.condition.location
            title       = rule.value.condition.title
          }
        }
        dynamic "values" {
          for_each = rule.value.has_values ? [1] : []
          content {
            allowed_values = try(rule.value.allow.values, null)
            denied_values  = try(rule.value.deny.values, null)
          }
        }
      }
    }
  }
}
