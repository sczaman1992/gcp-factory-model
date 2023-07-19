variable "parent" {
  description = "The resource name of the new TagKey's parent"
  type        = string
}

variable "tag_name" {
  description = "The user friendly name for a TagKey."
  type        = string
}

variable "tag_description" {
  description = "User-assigned description of the TagKey."
  type        = string
}

variable "purpose" {
  description = "A purpose cannot be changed once set. A purpose denotes that this Tag is intended for use in policies of a specific policy engine, and will involve that policy engine in management operations involving this Tag"
  type        = string
  default     = null
}

variable "purpose_data" {
  description = "Purpose data cannot be changed once set. Purpose data corresponds to the policy system that the tag is intended for."
  type        = map(string)
  default     = null
}

variable "tag_value" {
  description = "Tag Value map that includes: Tag Value name, description and optional Tag Value Binding (ex.//cloudresourcemanager.googleapis.com/projects/*****), region optional"
  default     = {}
  type = map(object({
    tag_value_description = optional(string)
  }))
}