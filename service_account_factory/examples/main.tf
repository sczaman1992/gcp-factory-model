module "service_accounts" {
  source          = "../"
  yamlconfig_dir  = "${path.module}/sample-data"
  host_project_id = "host_project"
  sub_network = {
    "subnet-01a" = {
      region = "us-central1"
    }
    "subnet-01b" = {
      region = "us-central1"
    }
  }
}


output "service_accounts" {
  value = module.service_accounts.service_accounts
}
