
variable "monitored_projects" {
  description = "Monitoring Project IDs."
  type        = map(object({}))
}
variable "metrics_scope_project_id" {
  description = "Logging Project ID."
  type        = string
}
