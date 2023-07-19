
variable "project_id" {
  description = "Project id of the project that holds the network."
  type        = string
}

variable "network" {
  description = "Network ID."
  type        = string
}

variable "custom_rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = {}
  type = map(object({
    description        = optional(string)
    direction          = string
    action             = string # (allow|deny)
    ranges             = optional(list(string))
    source_ranges      = optional(list(string))
    destination_ranges = optional(list(string))
    source_tags        = optional(list(string))
    target_tags        = optional(list(string))
    rules = optional(list(object({
      protocol = optional(string)
      ports    = optional(list(string))
    })))
    extra_attributes = optional(map(string))
  }))

  validation {
    condition = alltrue([
      for v in var.custom_rules :
      contains(["INGRESS", "EGRESS"], v.direction)
    ])
    error_message = "Each rule must have direction set to either \"INGRESS\" or \"EGRESS\"."
  }

  # validation {
  #   condition = alltrue([
  #     for v in var.custom_rules :
  #     v.source_tags != null && v.source_ranges == null
  #     if v.direction == "INGRESS"
  #   ])
  #   error_message = "source_tags is required for all INGRESS rules (source_ranges are rejected)."
  # }

  validation {
    condition = alltrue([
      for v in var.custom_rules :
      v.destination_ranges != null
      if v.direction == "EGRESS"
    ])
    error_message = "destination_ranges is required for all EGRESS rules."
  }


  validation {
    condition = alltrue([
      for v in var.custom_rules :
      contains(["allow", "deny"], v.action)
    ])
    error_message = "Each rule must have policy_rule_action of either \"allow\" or \"deny\"."
  }
}