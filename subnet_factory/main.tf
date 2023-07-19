locals {

  subnet_config_yamls = var.subnet_config_yamls

  subnets = {
    for f in fileset("${local.subnet_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.subnet_config_yamls}/${f}")).subnet_details.service_project_id => yamldecode(file("${local.subnet_config_yamls}/${f}")).subnet_details
  }
}

module "subnets" {
  source             = "./modules/subnets"
  for_each           = local.subnets
  service_project_id = try(each.value.service_project_id, var.service_project_id)
  host_project_id    = try(each.value.host_project_id, var.host_project_id)
  network_name       = try(each.value.network_name, var.network_name)
  subnets            = each.value.subnets
}


