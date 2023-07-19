variable "prefix" {
  description = "Service account prefix."
  type        = string
  default     = null
}

variable "yamlconfig_dir" {
  description = "Service account YAML directory."
  type        = string
}

variable "sub_network" {
  description = "Subnet Map"
  type = map(object({
    region = optional(string)
  }))
}

variable "host_project_id" {
  description = "Host Project ID"
  type        = string
}
