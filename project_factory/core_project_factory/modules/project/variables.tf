
variable "lien" {
  description = "Add a lien on the project to prevent accidental deletion"
  default     = false
  type        = bool
}


variable "project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "shared_vpc" {
  description = "The ID of the host project which hosts the shared VPC"
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "folder_id" {
  description = "The ID of a folder to host this project"
  type        = string
  default     = ""
}
variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["compute.googleapis.com"]
}

variable "shared_vpc_subnets" {
  description = "List of subnets fully qualified subnet IDs (ie. projects/$project_id/regions/$region/subnetworks/$subnet_id)"
  type        = list(string)
  default     = []
}

variable "auto_create_network" {
  description = "Create the default network"
  type        = bool
  default     = false
}

variable "default_network_tier" {
  description = "Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers."
  type        = string
  default     = ""
}

variable "disable_services_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed"
  default     = true
  type        = bool
}

variable "default_service_account" {
  description = "Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`."
  default     = "delete"
  type        = string
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  default     = true
  type        = bool
}

variable "enable_shared_vpc_service_project" {
  description = "If this project should be attached to a shared VPC. If true, you must set shared_vpc variable."
  type        = bool
  default     = false
}

variable "enable_shared_vpc_host_project" {
  description = "If this project is a shared VPC host project. If true, you must *not* set shared_vpc variable. Default is false."
  type        = bool
  default     = false
}

variable "enable_vpc_peer" {
  description = "If vpc peering is enabled = true"
  type        = bool
  default     = false
}

variable "vpc_peering_name" {
  type        = string
  description = "Name of the peering."
}

variable "host_network" {
  type        = string
  description = "The name of the primary network for the peering."
}

variable "peer_project_id" {
  type        = string
  description = "The peer network project id."
}

variable "peer_network" {
  type        = string
  description = "The peer network in the peering. The peer network may belong to a different project."
}

variable "import_custom_routes" {
  type        = bool
  description = "Whether to import the custom routes to the peer network."
  default     = false
}

variable "export_custom_routes" {
  type        = bool
  description = "Whether to export the custom routes to the peer network."
  default     = false
}

variable "import_subnet_routes_with_public_ip" {
  type        = bool
  description = "Whether subnet routes with public IP range are imported."
  default     = false
}

variable "export_subnet_routes_with_public_ip" {
  type        = bool
  description = "Whether subnet routes with public IP range are exported."
  default     = false
}


