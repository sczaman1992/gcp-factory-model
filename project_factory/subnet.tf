module "subnet_factory" {
  source             = "../subnet_factory/modules/subnets"
  for_each           = local.subnet_maps
  host_project_id    = local.projects[each.key].shared_vpc.svpc_host_project_id
  service_project_id = local.project_id
  network_name       = local.projects[each.key].shared_vpc.shared_vpc_network_name
  subnets            = each.value.subnets
  depends_on = [
    module.core_project_factory
  ]
}
