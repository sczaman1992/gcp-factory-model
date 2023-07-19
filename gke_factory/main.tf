locals {

  gke_config_yamls = var.yamlconfig_dir

  gkes = {
    for f in fileset("${local.gke_config_yamls}", "**/*.yaml") :
    yamldecode(file("${local.gke_config_yamls}/${f}")).gke_details.project_id => yamldecode(file("${local.gke_config_yamls}/${f}")).gke_details
  }
}


module "gkes" {
  source     = "./modules/private_gkes"
  for_each   = local.gkes
  project_id = each.key
  gkes       = each.value.gkes
}
