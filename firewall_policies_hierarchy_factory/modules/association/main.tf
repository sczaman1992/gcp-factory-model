resource "google_compute_firewall_policy_association" "policy_association" {
  for_each          = var.association
  firewall_policy   = var.firewall_policy
  name              = each.key
  attachment_target = try(local.org_folders_map["${each.value.policy_association_target}"], local.anchor_folder_map["${each.value.policy_association_target}"])
}

