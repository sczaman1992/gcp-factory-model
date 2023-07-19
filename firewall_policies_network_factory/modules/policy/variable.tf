variable "policy_name" {
  description = "The name for an association."
  type        = string
}
variable "project" {
  description = "The project for the resource."
  type        = string
}
variable "policy_description" {
  description = "Description of this resource."
  type        = string
}
variable "region" {
  description = "The location of this resource."
  type        = string
  default     = null
}