locals {
  domain_name = "${var.domain_prefix}.${var.domain}"
}

/*****************************************
  Organization info retrieval
 *****************************************/

module "core_project_factory" {
  source                              = "./modules/project"
  lien                                = var.lien
  org_id                              = var.org_id
  name                                = var.name
  project_id                          = var.project_id
  shared_vpc                          = var.svpc_host_project_id
  enable_shared_vpc_service_project   = var.enable_shared_vpc_service_project
  enable_shared_vpc_host_project      = var.enable_shared_vpc_host_project
  enable_vpc_peer                     = var.enable_vpc_peer
  vpc_peering_name                    = var.vpc_peering_name
  host_network                        = var.shared_vpc_network_name
  peer_network                        = var.peer_network
  peer_project_id                     = var.peer_project_id
  import_custom_routes                = var.import_custom_routes
  export_custom_routes                = var.export_custom_routes
  import_subnet_routes_with_public_ip = var.import_subnet_routes_with_public_ip
  export_subnet_routes_with_public_ip = var.export_subnet_routes_with_public_ip
  billing_account                     = var.billing_account
  folder_id                           = var.folder_id
  activate_apis                       = var.activate_apis
  disable_services_on_destroy         = var.disable_services_on_destroy
  disable_dependent_services          = var.disable_dependent_services
  default_network_tier                = var.default_network_tier
}

/******************************************
  Shared VPC to create if shared vpc project
 *****************************************/
module "vpc" {
  source = "./modules/vpc_network"
  count  = var.enable_shared_vpc_host_project ? 1 : 0

  project_id   = module.core_project_factory.project_id
  network_name = var.shared_vpc_network_name

  shared_vpc_host                        = false
  auto_create_subnetworks                = false
  routing_mode                           = var.shared_vpc_routing_mode
  delete_default_internet_gateway_routes = true
  # mtu                             = var.shared_vpc_mtu
}
/******************************************
  DNS Zone to create if shared vpc project
 *****************************************/
module "shared_vpc_dns" {
  source     = "./modules/cloud_dns"
  count      = var.enable_shared_vpc_host_project ? 1 : 0
  name       = "${replace(local.domain_name, ".", "-")}-zone"
  domain     = "${local.domain_name}."
  project_id = module.core_project_factory.project_id

  type = "private"
  private_visibility_config_networks = [
    "${module.vpc.0.network_self_link}"
  ]
}