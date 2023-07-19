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
}

variable "role" {
  description = "Permission Roles"
  type        = string
}

variable "member" {
  description = "Service Account Member ID"
  type        = string
}

