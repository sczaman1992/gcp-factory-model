
################################################################################
#                                dynamic rules                                 #
################################################################################

resource "google_compute_firewall" "custom" {
  for_each           = var.custom_rules
  name               = each.key
  description        = each.value.description
  direction          = each.value.direction
  network            = var.network
  project            = var.project_id
  source_ranges      = each.value.source_ranges
  destination_ranges = each.value.destination_ranges
  source_tags        = each.value.source_tags
  target_tags        = each.value.target_tags
  disabled           = lookup(each.value.extra_attributes, "disabled", false)
  priority           = lookup(each.value.extra_attributes, "priority", 1000)


  dynamic "log_config" {
    for_each = lookup(each.value.extra_attributes, "flow_logs", false) ? [{
      metadata = lookup(each.value.extra_attributes, "flow_logs_metadata", "INCLUDE_ALL_METADATA")
    }] : []
    content {
      metadata = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "allow"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }

  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "deny"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }
}
