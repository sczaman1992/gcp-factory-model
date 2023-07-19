module "example" {
  source                        = "../"
  monitoring_scope_config_files = "./sample-data"

}

output "example" {
  value = module.example
}
