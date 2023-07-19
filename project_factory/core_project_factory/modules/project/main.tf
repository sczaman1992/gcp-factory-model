

/******************************************
  Locals configuration
 *****************************************/
locals {
  base_project_id   = var.project_id == "" ? var.name : var.project_id
  project_org_id    = var.folder_id != "" ? null : var.org_id
  project_folder_id = var.folder_id != "" ? var.folder_id : null

}

/*******************************************
  Project creation
 *******************************************/
resource "google_project" "main" {
  name                = var.name
  project_id          = local.base_project_id
  org_id              = local.project_org_id
  folder_id           = local.project_folder_id
  billing_account     = var.billing_account
  auto_create_network = var.auto_create_network
}

/******************************************
  Project lien
 *****************************************/
resource "google_resource_manager_lien" "lien" {
  count        = var.lien ? 1 : 0
  parent       = "projects/${google_project.main.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "project-factory"
  reason       = "Project Factory lien"
}

/******************************************
  APIs configuration
 *****************************************/
module "project_services" {
  source = "../project_services"

  project_id                  = google_project.main.project_id
  activate_apis               = var.activate_apis
  disable_services_on_destroy = var.disable_services_on_destroy
  disable_dependent_services  = var.disable_dependent_services
}

/******************************************
  Shared VPC configuration
 *****************************************/

resource "google_compute_shared_vpc_service_project" "shared_vpc_attachment" {

  count           = var.enable_shared_vpc_service_project ? 1 : 0
  host_project    = var.shared_vpc
  service_project = google_project.main.project_id
}

resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {

  count      = var.enable_shared_vpc_host_project ? 1 : 0
  project    = google_project.main.project_id
  depends_on = [module.project_services]
}

/******************************************
	VPC Peering
 *****************************************/

resource "google_compute_network_peering" "vpc_peering" {
  count        = var.enable_vpc_peer ? 1 : 0
  name         = var.vpc_peering_name
  network      = "projects/${var.project_id}/global/networks/${var.host_network}"
  peer_network = "projects/${var.peer_project_id}/global/networks/${var.peer_network}"

  import_custom_routes                = var.import_custom_routes
  export_custom_routes                = var.export_custom_routes
  import_subnet_routes_with_public_ip = var.import_subnet_routes_with_public_ip
  export_subnet_routes_with_public_ip = var.export_subnet_routes_with_public_ip
  depends_on                          = [module.project_services]
}

/******************************************
  Default Service Account configuration
 *****************************************/
resource "google_project_default_service_accounts" "default_service_accounts" {
  count          = upper(var.default_service_account) == "KEEP" ? 0 : 1
  action         = upper(var.default_service_account)
  project        = google_project.main.project_id
  restore_policy = "REVERT_AND_IGNORE_FAILURE"
  depends_on     = [module.project_services]
}


/******************************************
  Configure default Network Service Tier
 *****************************************/
resource "google_compute_project_default_network_tier" "default" {
  count        = var.default_network_tier != "" ? 1 : 0
  project      = google_project.main.number
  network_tier = var.default_network_tier
}
