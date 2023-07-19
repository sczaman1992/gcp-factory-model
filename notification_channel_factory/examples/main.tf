module "example" {
  source                            = "../"
  notification_channel_config_files = "./sample-data"

}

output "example" {
  value = module.example
}