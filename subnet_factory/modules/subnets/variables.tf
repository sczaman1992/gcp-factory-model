
variable "host_project_id" {
  description = "The ID of the project where subnets will be created"
  type        = string
}
variable "service_project_id" {
  description = "The ID of the project where subnets will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the network where subnets will be created"
  type        = string
}

variable "subnets" {
  type = map(object({
    description                = optional(string),
    region                     = string,
    purpose                    = optional(string),
    role                       = optional(string),
    stack                      = optional(string),
    ipv6_type                  = optional(string),
    ip_cidr_range              = string,
    private_ip_google_access   = optional(bool),
    private_ipv6_google_access = optional(bool),
    flow_logs_enable           = optional(bool),
    flow_logs = optional(object({
      aggregation_interval = optional(string),
      flow_sampling        = optional(string),
      metadata             = optional(string),
      filter_expr          = optional(string),
    }))
    secondary_ip_range = optional(list(object({
      range_name    = optional(string),
      ip_cidr_range = optional(string)
    })))
    }
  ))


}



