variable "yamlconfig_dir" {
  description = "YAML directory."
  type        = string
}

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
  default     = "" //// TODO remove
}
