locals {
  monitoring_scope_config = var.monitoring_scope_config_files
  monitoring_scope_config_map = {
    for f in fileset("${local.monitoring_scope_config}", "**/*.yaml") :
    yamldecode(file("${local.monitoring_scope_config}/${f}")).monitoring_scope_details.metrics_scope_project_id => yamldecode(file("${local.monitoring_scope_config}/${f}")).monitoring_scope_details
  }
}

module "monitoring_scope" {
  source                   = "./modules/monitoring_scope"
  for_each                 = local.monitoring_scope_config_map
  monitored_projects       = each.value.monitored_projects
  metrics_scope_project_id = each.value.metrics_scope_project_id
}
