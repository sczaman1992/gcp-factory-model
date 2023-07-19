module "custom_roles" {
  source           = "../"
  org_id           = "222222222"
  custom_role_yaml = "./sample-data"
}

output "custom_roles" {
  value = module.custom_roles
}