locals {
  subnet_config_yamls = "./sample-data"
}

module "subnet_factory" {
  source              = "../"
  subnet_config_yamls = local.subnet_config_yamls

}

