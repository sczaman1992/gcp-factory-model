
###############################################################################
#                                global policy                                #
###############################################################################
resource "google_compute_network_firewall_policy_association" "association" {
  for_each          = var.region == null ? var.association : {}
  name              = each.key
  attachment_target = each.value.policy_association_target
  firewall_policy   = var.firewall_policy
  project           = var.project
}

###############################################################################
#                               regional policy                               #
###############################################################################
resource "google_compute_region_network_firewall_policy_association" "association" {
  for_each          = var.region != null ? var.association : {}
  name              = each.key
  attachment_target = each.value.policy_association_target
  firewall_policy   = var.firewall_policy
  project           = var.project
  region            = var.region
}



