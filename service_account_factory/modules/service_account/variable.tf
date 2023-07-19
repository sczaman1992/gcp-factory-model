variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
}

variable "organization_id" {
  description = "Organization ID"
  type        = string
  default     = null
}

variable "sub_network" {
  description = "Subnet Map"
  type = map(object({
    region = optional(string)
  }))
  default = {}
}

variable "host_project_id" {
  description = "Host Project ID"
  type        = string
  default     = null
}

variable "service_accounts" {
  description = "Service Account Role Map"
  type = map(object({
    project_roles      = optional(list(string))
    folder_roles       = optional(list(string))
    organization_roles = optional(list(string))
    subnet_roles       = optional(list(string))
  }))
}

