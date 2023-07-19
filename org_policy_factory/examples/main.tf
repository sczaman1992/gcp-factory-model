module "org_policies" {
  source                 = "../"
  org_policies_data_path = "${path.module}/sample-data"
  parent                 = "organizations/1000000"
}
