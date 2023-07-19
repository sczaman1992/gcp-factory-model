module "example" {
  source                    = "../"
  budget_alert_config_files = "./sample-data"
  service_project_number    = "11111111"
}

output "example" {
  value = module.example
}