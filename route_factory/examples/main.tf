locals {
  route_config_yamls = "./sample-data"
}

module "route_factory" {
  source             = "../"
  route_config_yamls = local.route_config_yamls

}

