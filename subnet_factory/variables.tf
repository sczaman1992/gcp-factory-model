variable "subnet_config_yamls" {
  description = "Subnet configuration YAML directory"
  type        = string
}
variable "network_name" {
  description = "Network ID"
  type        = string
  default     = null
}

variable "service_project_id" {
  description = "Service project ID"
  type        = string
  default     = null
}
variable "host_project_id" {
  description = "Host project ID"
  type        = string
  default     = null
}
