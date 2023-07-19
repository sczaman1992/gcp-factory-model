module "folders" {
  source     = "../"
  folder_dir = "./sample-data"
  parent     = "parent"
}

output "folders" {
  value = module.folders
}