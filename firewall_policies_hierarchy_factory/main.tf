locals {
  policy_maps = {
    for f in fileset("${local._firewall_dir}", "**/*.yaml") :
    yamldecode(file("${local._firewall_dir}/${f}")).hierarchy_policy.policy_name => yamldecode(file("${local._firewall_dir}/${f}")).hierarchy_policy
  }

  _firewall_dir = var.firewall_dir

}

module "firewall_policy" {
  source             = "./modules/policy"
  for_each           = local.policy_maps
  parent             = each.value.parent
  policy_name        = each.value.policy_name
  policy_description = each.value.policy_description
  org_id             = var.org_id
  anchor_folder_name = var.anchor_folder_name
}

module "custom_rules" {
  source          = "./modules/rules"
  firewall_policy = module.firewall_policy[each.value.policy_name].id
  for_each        = local.policy_maps
  custom_rules    = each.value.custom_rules
}

module "policy_association" {
  source             = "./modules/association"
  firewall_policy    = module.firewall_policy[each.value.policy_name].id
  for_each           = local.policy_maps
  association        = each.value.association
  org_id             = var.org_id
  anchor_folder_name = var.anchor_folder_name
}
