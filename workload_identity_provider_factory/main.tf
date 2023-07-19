locals {
  provider_config_yamls = var.provider_config_yamls
  workload_identity_providers = {
    for f in fileset("${local.provider_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.provider_config_yamls}/${f}")).workload_identity_provider_details.project_id => yamldecode(file("${local.provider_config_yamls}/${f}")).workload_identity_provider_details
  }
}

module "workload_identity_provider" {
  source                     = "./modules/workload_identity_provider"
  for_each                   = local.workload_identity_providers
  workload_identity_pool_id  = each.value.workload_identity_pool_id
  project_id                 = each.value.project_id
  project_number             = var.project_number
  workload_identity_provider = each.value.workload_identity_provider
}


