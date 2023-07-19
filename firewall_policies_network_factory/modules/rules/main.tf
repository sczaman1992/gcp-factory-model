###############################################################################
#                                global policy                                #
###############################################################################

resource "google_compute_network_firewall_policy_rule" "policy_rules" {
  for_each        = var.region == null ? var.custom_rules : {}
  firewall_policy = var.firewall_policy
  project         = var.project
  rule_name       = each.key
  description     = each.value.policy_rule_description
  priority        = each.value.policy_rule_priority
  enable_logging  = each.value.policy_rule_enable_logging
  action          = each.value.policy_rule_action
  direction       = each.value.policy_rule_direction
  disabled        = each.value.policy_rule_disabled
  target_secure_tags {
    name = each.value.target_secure_tags.name
  }
  match {
    layer4_configs {
      ip_protocol = each.value.match.layer4_configs.ip_protocol
      ports       = each.value.match.layer4_configs.ports
    }
    src_secure_tags {
      name = try(each.value.match.src_secure_tags.name, "")
    }
    dest_ip_ranges = each.value.match.dest_ip_ranges
    src_ip_ranges  = each.value.match.src_ip_ranges
  }
}

###############################################################################
#                               regional policy                               #
###############################################################################
resource "google_compute_region_network_firewall_policy_rule" "policy_rules" {
  for_each        = var.region != null ? var.custom_rules : {}
  firewall_policy = var.firewall_policy
  project         = var.project
  region          = var.region
  rule_name       = each.key
  description     = each.value.policy_rule_description
  priority        = each.value.policy_rule_priority
  enable_logging  = each.value.policy_rule_enable_logging
  action          = each.value.policy_rule_action
  direction       = each.value.policy_rule_direction
  disabled        = each.value.policy_rule_disabled
  target_secure_tags {
    name = each.value.target_secure_tags.name
  }
  match {
    layer4_configs {
      ip_protocol = each.value.match.layer4_configs.ip_protocol
      ports       = each.value.match.layer4_configs.ports
    }
    src_secure_tags {
      name = try(each.value.match.src_secure_tags.name, "")
    }
    dest_ip_ranges = each.value.match.dest_ip_ranges
    src_ip_ranges  = each.value.match.src_ip_ranges
  }
}


