variable "project_id" {
  description = "The ID of the project where routes will be created"
  type        = string
  default     = null
}
variable "network" {
  description = "The ID of the network where routes will be created"
  type        = string
  default     = null
}
variable "route_config_yamls" {
  description = "route configuration YAML directory"
  type        = string
}
