module "firewall_test" {
  source             = "../"
  firewall_dir       = "${path.module}/sample-data"
  org_id             = "514041104475"
  anchor_folder_name = "desktop-anchor-folder"
}

output "firewall_test" {
  value = module.firewall_test
}
