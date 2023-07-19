locals {
  policy_config = {
    for f in fileset("${local.firewall_dir}", "**/*.yaml") :
    yamldecode(file("${local.firewall_dir}/${f}")).network_policy.policy_name => yamldecode(file("${local.firewall_dir}/${f}")).network_policy
  }
  firewall_dir = var.firewall_dir
}


module "firewall_policy" {
  source             = "./modules/policy"
  for_each           = local.policy_config
  project            = each.value.project
  policy_name        = each.value.policy_name
  policy_description = each.value.policy_description
  region             = each.value.region
}

module "custom_rules" {
  source          = "./modules/rules"
  firewall_policy = module.firewall_policy[each.value.policy_name].id
  for_each        = local.policy_config
  custom_rules    = each.value.custom_rules
  region          = each.value.region
  project         = each.value.project
}

module "policy_association" {
  source          = "./modules/association"
  firewall_policy = module.firewall_policy[each.value.policy_name].id
  for_each        = local.policy_config
  association     = each.value.association
  region          = each.value.region
  project         = each.value.project
}