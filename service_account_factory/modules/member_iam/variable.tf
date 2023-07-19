variable "prefix" {
  type = string
}

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

variable "project_roles" {
  description = "List of Project Roles"
  type        = list(string)
  default     = []
}

variable "folder_roles" {
  description = "List of Folder Roles"
  type        = list(string)
  default     = []
}

variable "organization_roles" {
  description = "List of Org Roles"
  type        = list(string)
  default     = []
}

variable "subnet_roles" {
  description = "List of Subnet Roles"
  type        = list(string)
  default     = []
}

variable "host_project_id" {
  description = "Host Project ID"
  type        = string
}

variable "service_account_address" {
  description = "Full Service Account Address ID"
  type        = string
}
