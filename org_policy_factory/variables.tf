variable "org_policies" {
  description = "Organization policies applied to this project keyed by policy name."
  type = map(object({
    inherit_from_parent = optional(bool) # for list policies only.
    reset               = optional(bool)
    rules = optional(list(object({
      allow = optional(object({
        all    = optional(bool)
        values = optional(list(string))
      }))
      deny = optional(object({
        all    = optional(bool)
        values = optional(list(string))
      }))
      enforce = optional(bool) # for boolean policies only.
      condition = optional(object({
        description = optional(string)
        expression  = optional(string)
        location    = optional(string)
        title       = optional(string)
      }), {})
    })), [])
  }))
  default  = {}
  nullable = false
}

variable "org_policies_file_path" {
  description = "file Path containing org policies in YAML format."
  type        = string
  default     = null
}
variable "org_policies_data_path" {
  description = "Path containing org policies in YAML format."
  type        = string
  default     = null
}

variable "parent" {
  description = "Parent ID"
  type        = string
  validation {
    condition = can(regex("^(organizations/|folders/|projects/)", var.parent))

    error_message = "Valid values for the parent variable are projects/<projectid>, folders/<folderid>, organizations/<organizaionid>"
  }
}
