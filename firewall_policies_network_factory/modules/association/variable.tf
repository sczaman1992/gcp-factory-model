variable "association" {
  description = "A map of firewall policy associations"
  type = map(object({
    policy_association_target = string
  }))
}

variable "firewall_policy" {
  description = "The firewall policy ID of the association."
  type        = string
}

variable "region" {
  description = "The location of this resource."
  type        = string
  default     = null
}

variable "project" {
  description = "The project for the resource."
  type        = string
}
