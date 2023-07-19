locals {
  organization_yaml    = var.organization_yaml
  organization         = yamldecode(file("${local.organization_yaml}"))
  project_config_yamls = var.project_config_yamls
  projects = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).project_details
  }
  service_accounts_maps = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).service_account_details
    if can(yamldecode(file("${local.project_config_yamls}/${f}")).service_account_details)
  }
  tag_maps = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).tag
    if can(yamldecode(file("${local.project_config_yamls}/${f}")).tag)
  }
  subnet_maps = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).subnet_details
    if can(yamldecode(file("${local.project_config_yamls}/${f}")).subnet_details)
  }
  budget_alert_config_map = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).budget_details
    if can(yamldecode(file("${local.project_config_yamls}/${f}")).budget_details)
  }
  notification_channel_config_map = {
    for f in fileset("${local.project_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.project_config_yamls}/${f}")).project_details.name => yamldecode(file("${local.project_config_yamls}/${f}")).notification_channels_details
    if can(yamldecode(file("${local.project_config_yamls}/${f}")).notification_channels_details)
  }
  project_id     = module.core_project_factory[one([for k, v in local.projects : v.name])].project_id
  project_number = module.core_project_factory[one([for k, v in local.projects : v.name])].project_number
}

# module "validator" {
#   source    = "./validator"
#   for_each  = local.projects
#   yaml_data = merge("${local.defaults}", "${each.value}")
# }
module "core_project_factory" {
  source                              = "./core_project_factory"
  for_each                            = local.projects
  org_id                              = try(local.organization.organization.org_id, var.org_id)
  domain                              = local.organization.organization.domain
  domain_prefix                       = each.value.domain_prefix
  default_network_tier                = local.organization.organization.default_network_tier
  name                                = each.value.name
  project_id                          = try(each.value.project_id, each.value.name)
  enable_shared_vpc_service_project   = try(each.value.enable_shared_vpc_service_project, false)
  svpc_host_project_id                = try(each.value.shared_vpc.svpc_host_project_id, null)
  enable_shared_vpc_host_project      = try(each.value.shared_vpc.enable_shared_vpc_host_project, false)
  shared_vpc_network_name             = try(each.value.shared_vpc.shared_vpc_network_name, null)
  shared_vpc_routing_mode             = try(each.value.shared_vpc.shared_vpc_routing_mode, null)
  enable_vpc_peer                     = try(each.value.vpc_peer.enable_vpc_peer, false)
  vpc_peering_name                    = try(each.value.vpc_peer.vpc_peering_name, null)
  peer_network                        = try(each.value.vpc_peer.peer_network, null)
  peer_project_id                     = try(each.value.vpc_peer.peer_project_id, null)
  import_custom_routes                = try(each.value.vpc_peer.import_custom_routes, false)
  export_custom_routes                = try(each.value.vpc_peer.export_custom_routes, false)
  import_subnet_routes_with_public_ip = try(each.value.vpc_peer.import_subnet_routes_with_public_ip, false)
  export_subnet_routes_with_public_ip = try(each.value.vpc_peer.export_subnet_routes_with_public_ip, false)
  billing_account                     = try(local.organization.organization.billing_account, var.billing_account)
  folder_id                           = local.anchor_folder_map["${each.value.folder_name}"]
  activate_apis                       = each.value.apis.activate_apis
  lien                                = local.organization.organization.enable_lien
  disable_services_on_destroy         = each.value.apis.disable_services_on_destroy
  disable_dependent_services          = each.value.apis.disable_dependent_services
  # depends_on = [
  #   module.validator
  # ]
}


