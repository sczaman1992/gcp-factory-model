module "workload_identity_provider" {
  source                = "../"
  provider_config_yamls = "./sample-data/"
  project_number        = 3833424294
}

output "workload_identity_provider" {
  value = module.workload_identity_provider
}
