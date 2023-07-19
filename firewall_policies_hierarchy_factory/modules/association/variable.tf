variable "association" {
  description = "A map of firewall policy associations"
  type = map(object({
    policy_association_target = string
  }))
}

variable "firewall_policy" {
  description = "The firewall policy ID of the association."
  type        = string
}

variable "org_id" {
  description = "Organization ID"
  type        = string
}

variable "anchor_folder_name" {
  description = "Anchor Folder ID"
  type        = string
}


