
module "project" {
  source          = "../"
  org_id          = "43214324"
  name            = "test-project-name"
  billing_account = "test-billing-account"
  activate_apis   = ["compute.googleapis.com"]
}
output "project" {
  value = module.project
}