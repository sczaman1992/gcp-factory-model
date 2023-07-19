module "alert_example" {
  source                      = "../"
  monitoring_alert_config_dir = "./sample-data"
  project_id                  = "test-project"

}

output "example_output" {
  value = module.alert_example
}
