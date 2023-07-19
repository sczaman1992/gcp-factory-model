variable "service_project_id" {
  description = "Project ID."
  type        = string
}

variable "service_project_number" {
  description = "Project Number."
  type        = string
}

variable "notification_channels" {
  description = "Notification Channel Name"
  type        = list(string)
  default     = null
}

variable "billing_account" {
  description = "Billing Account ID"
  type        = string
}


variable "budgets" {
  description = "Budget Alert configuration details"
  type = map(object({
    budget_filter = optional(object({
      create_budget          = optional(bool, true)
      credit_types_treatment = optional(string)
      services               = optional(list(string))
      calendar_period        = optional(string)
      custom_period = optional(object({
        start_date = optional(object({
          day   = optional(number)
          month = optional(number)
          year  = optional(number)
        }))
        end_date = optional(object({
          day   = optional(number)
          month = optional(number)
          year  = optional(number)
        }))
      }))
    }))
    amount = optional(object({
      specified_amount = optional(object({
        currency_code   = string
        currency_amount = number
      }))
    }))
    threshold_rules = optional(object({
      alert_spent_percents = optional(number)
      alert_spend_basis    = optional(string)
    }))
    all_updates_rule = optional(object({
      alert_pubsub_topic               = optional(string)
      monitoring_notification_channels = optional(list(string))
    }))
  }))
}