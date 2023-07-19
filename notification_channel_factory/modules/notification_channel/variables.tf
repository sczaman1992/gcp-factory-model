variable "service_project_id" {
  description = "Project ID"
  type        = string
}

variable "notification_channels" {
  description = "Notification Channel Map"
  default     = {}
  type = map(object({
    type        = string
    enabled     = optional(bool, true)
    description = optional(string, "created by terraform")
    user_labels = optional(map(string))
    labels      = optional(map(string))
  }))
}
