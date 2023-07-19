module "tag" {
  source  = "../"
  tag_dir = "./sample-data/"
}

output "tag" {
  value = module.tag
}
