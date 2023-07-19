variable "region" {
  description = "The location of this resource."
  type        = string
}

variable "project" {
  description = "project name."
  type        = string
}

variable "firewall_policy" {
  description = "The firewall policy ID of the association."
  type        = string
}

variable "custom_rules" {
  description = "List of firewall policy rule definitions ."
  default     = {}
  type = map(object({
    policy_rule_description    = optional(string)
    policy_rule_priority       = number
    policy_rule_enable_logging = optional(bool, true)
    policy_rule_action         = string
    policy_rule_direction      = string
    policy_rule_disabled       = optional(bool, true)
    target_secure_tags = optional(object({
      name = optional(string)
    }))
    match = optional(object({
      layer4_configs = optional(object({
        ip_protocol = optional(string)
        ports       = optional(list(string))
      }))
      src_secure_tags = optional(object({
        name = optional(string)
      }))
      dest_ip_ranges = optional(list(string))
      src_ip_ranges  = optional(list(string))
    }))
  }))


  validation {
    condition = alltrue([
      for v in var.custom_rules :
      contains(["INGRESS", "EGRESS"], v.policy_rule_direction)
    ])
    error_message = "Each rule must have policy_rule_direction of either \"INGRESS\" or \"EGRESS\"."
  }

  validation {
    condition = alltrue([
      for v in var.custom_rules :
      v.match.src_secure_tags != null && v.match.src_ip_ranges == null
      if v.policy_rule_direction == "INGRESS"
    ])
    error_message = "src_secure_tags is required for all INGRESS rules (src_ip_ranges are rejected)."
  }

  validation {
    condition = alltrue([
      for v in var.custom_rules :
      v.match.dest_ip_ranges != null
      if v.policy_rule_direction == "EGRESS"
    ])
    error_message = "dest_ip_ranges is required for all EGRESS rules."
  }


  validation {
    condition = alltrue([
      for v in var.custom_rules :
      contains(["allow", "deny", "goto_next"], v.policy_rule_action)
    ])
    error_message = "Each rule must have policy_rule_action of either \"allow\" or \"deny\" or \"goto_next\"."
  }

}