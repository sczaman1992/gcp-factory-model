module "example" {
  source                 = "../"
  dashboard_config_files = "./sample-data"
  project_id             = "test-project"

}

output "example" {
  value = module.example
}
