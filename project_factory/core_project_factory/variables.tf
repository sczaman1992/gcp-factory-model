
variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "domain" {
  description = "The domain name (optional)."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "svpc_host_project_id" {
  description = "The ID of the host project which hosts the shared VPC"
  type        = string
  default     = ""
}

variable "enable_shared_vpc_host_project" {
  description = "If this project is a shared VPC host project. If true, you must *not* set svpc_host_project_id variable. Default is false."
  type        = bool
  default     = false
}

variable "enable_shared_vpc_service_project" {
  description = "If this project is a shared VPC service project. If true, you must set svpc_host_project_id variable. Default is false."
  type        = bool
  default     = false
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
  default     = []
}

variable "lien" {
  description = "Add a lien on the project to prevent accidental deletion"
  type        = bool
  default     = false
}

variable "disable_services_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed"
  default     = true
  type        = bool
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  default     = true
  type        = bool
}



variable "essential_contacts" {
  description = "A mapping of users or groups to be assigned as Essential Contacts to the project, specifying a notification category"
  type        = map(list(string))
  default     = {}
}

variable "language_tag" {
  description = "Language code to be used for essential contacts notifications"
  type        = string
  default     = "en-US"
}

variable "shared_vpc_network_name" {
  description = "VPC network to be created for shared vpc project"
  type        = string
  default     = null
}

variable "shared_vpc_routing_mode" {
  description = "The network-wide routing mode to use."
  type        = string
  default     = "REGIONAL"
}

variable "grant_services_security_admin_role" {
  description = "Whether or not to grant Kubernetes Engine Service Agent the Security Admin role on the host project so it can manage firewall rules"
  type        = bool
  default     = false
}

variable "grant_network_role" {
  description = "Whether or not to grant networkUser role on the host project/subnets"
  type        = bool
  default     = true
}

variable "domain_prefix" {
  description = "The prefix of domain. Example : project1, sharedvpc"
  type        = string
  default     = null
}

variable "default_network_tier" {
  description = "Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers."
  type        = string
  default     = ""
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
