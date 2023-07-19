module "firewall_rules" {
  source       = "./modules/firewall_rules"
  for_each     = local.firewall_rules
  project_id   = each.value.project_id
  network      = each.value.network
  custom_rules = each.value.custom_rules
}




