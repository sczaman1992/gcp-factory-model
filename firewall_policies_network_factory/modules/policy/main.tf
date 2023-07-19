

###############################################################################
#                                global policy                                #
###############################################################################
resource "google_compute_network_firewall_policy" "policy" {
  count       = var.region == null ? 1 : 0
  project     = var.project
  name        = var.policy_name
  description = var.policy_description
}

###############################################################################
#                               regional policy                               #
###############################################################################
resource "google_compute_region_network_firewall_policy" "policy" {
  count       = var.region != null ? 1 : 0
  region      = var.region
  project     = var.project
  name        = var.policy_name
  description = var.policy_description
}


