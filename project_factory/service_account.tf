module "service_account_factory" {
  source           = "../service_account_factory/modules/service_account"
  for_each         = local.service_accounts_maps
  project_id       = local.project_id
  service_accounts = each.value.service_accounts
  host_project_id  = try(local.projects[each.key].shared_vpc.svpc_host_project_id, null)
  sub_network = try({
    for subnets, value in local.subnet_maps[local.project_id].subnets : subnets => {
      region = try(value.region, null)
    }
  }, null)

  depends_on = [
    module.core_project_factory,
    module.subnet_factory
  ]
}
