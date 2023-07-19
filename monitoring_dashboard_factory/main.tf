locals {
  project_dashboards_config = var.dashboard_config_files
  project_dashboards_config_map = {
    for f in fileset("${local.project_dashboards_config}", "**/*.yaml") :
    var.project_id => yamldecode(file("${local.project_dashboards_config}/${f}")).dashboard_details
  }
}

module "project_dashboards" {
  source             = "./modules/dashboards"
  for_each           = local.project_dashboards_config_map
  dashboards         = each.value.dashboards
  service_project_id = var.project_id
}


