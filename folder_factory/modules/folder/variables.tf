
variable "parent" {
  type        = string
  description = "The resource name of the parent Folder or Organization. Must be of the form folders/folder_id or organizations/org_id"
}

variable "names" {
  type        = list(string)
  description = "Folder names."
  default     = []
}

variable "prefix" {
  type        = string
  description = "Optional prefix to enforce uniqueness of folder names."
  default     = ""
}
