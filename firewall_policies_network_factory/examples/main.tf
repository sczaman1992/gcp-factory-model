module "firewall_test" {
  source       = "../"
  firewall_dir = "${path.module}/sample-data"
}

output "firewall_test" {
  value = module.firewall_test
}
