resource "google_compute_firewall_policy_rule" "policy_rule" {
  for_each                = var.custom_rules
  firewall_policy         = var.firewall_policy
  description             = each.value.policy_rule_description
  priority                = each.value.policy_rule_priority
  enable_logging          = each.value.policy_rule_enable_logging
  action                  = each.value.policy_rule_action
  direction               = each.value.policy_rule_direction
  disabled                = each.value.policy_rule_disabled
  target_resources        = each.value.policy_rule_target_resources
  target_service_accounts = each.value.policy_rule_target_service_accounts
  match {
    layer4_configs {
      ip_protocol = each.value.match.layer4_configs.ip_protocol
      ports       = each.value.match.layer4_configs.ports
    }
    dest_ip_ranges = each.value.match.dest_ip_ranges
    src_ip_ranges  = each.value.match.src_ip_ranges
  }
}