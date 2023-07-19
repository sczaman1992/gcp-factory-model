resource "google_compute_firewall_policy" "policy" {
  parent      = try(local.org_folders_map["${var.parent}"], var.parent)
  short_name  = var.policy_name
  description = var.policy_description
}
