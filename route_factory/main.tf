locals {

  route_config_yamls = var.route_config_yamls

  routes = {
    for f in fileset("${local.route_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.route_config_yamls}/${f}")).route_details.project_id => yamldecode(file("${local.route_config_yamls}/${f}")).route_details
  }
}

module "routes" {
  source     = "./modules/routes"
  for_each   = local.routes
  project_id = try(each.value.project_id, var.project_id)
  network    = try(each.value.network, var.network)
  routes     = each.value.routes
}


