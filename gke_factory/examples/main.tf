module "gke" {
  source         = "../"
  yamlconfig_dir = "${path.module}/sample-data"

}


output "gke" {
  value = module.gke
}
