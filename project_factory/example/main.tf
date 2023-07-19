
module "projects_factories" {
  source = "../"

  org_id               = "514041104475"
  billing_account      = "AYHG7675TR%"
  organization_yaml    = "./sample-data/projects/organization.yaml"
  project_config_yamls = "./sample-data/projects/config"

  anchor_folder_name = "desktop-anchor-folder"
}

output "projects_factories" {
  value = module.projects_factories
}