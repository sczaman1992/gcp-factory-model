variable "parent" {
  description = "The parent of the firewall policy."
  type        = string
}

variable "policy_name" {
  description = "User-provided name of the Organization firewall policy"
  type        = string
}

variable "policy_description" {
  description = "A description of this resource."
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


