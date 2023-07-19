variable "project_id" {
  type        = string
  description = "Project ID."
}

variable "project_number" {
  type        = number
  description = "Project Number."
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The name of workload identity pool"
}

variable "workload_identity_provider" {
  type = map(object({
    hostname                             = string
    attribute_mapping                    = map(string)
    disabled                             = optional(bool, false)
    description                          = optional(string)
    attribute_condition                  = string
    allowed_audiences                    = list(string)
    service_account_id                   = string
    workload_pool_service_account_role   = string
    workload_pool_service_account_member = string
  }))
}

