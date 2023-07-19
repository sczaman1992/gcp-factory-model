variable "org_id" {
  description = "Organization ID."
  type        = string
  default     = null
}

variable "anchor_folder_name" {
  description = "Anchor folder ID"
  type        = string
}

variable "billing_account" {
  description = "Billing account ID."
  type        = string
  default     = null
}

variable "organization_yaml" {
  description = "Organization YAML file location"
  type        = string
}

variable "project_config_yamls" {
  description = "Project YAML file location"
  type        = string
}
