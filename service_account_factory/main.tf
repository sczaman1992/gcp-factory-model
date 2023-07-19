locals {

  sa_config_yamls = var.yamlconfig_dir

  service_accounts = {
    for f in fileset("${local.sa_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.sa_config_yamls}/${f}")).service_account_details.project_id => yamldecode(file("${local.sa_config_yamls}/${f}")).service_account_details
  }
}


module "service_accounts" {
  source           = "./modules/service_account"
  for_each         = local.service_accounts
  project_id       = each.value.project_id
  folder_id        = try(each.value.folder_id, null)
  organization_id  = try(each.value.organization_id, null)
  sub_network      = var.sub_network
  host_project_id  = var.host_project_id
  service_accounts = each.value.service_accounts
}
