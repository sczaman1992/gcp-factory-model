variable "folder_dir" {
  description = "folder file path"
  type        = string
}
variable "parent" {
  type        = string
  description = "The resource name of the parent Folder or Organization. Must be of the form folders/folder_id or organizations/org_id"
}
