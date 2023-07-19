locals {
  folders_file = {
    for f in fileset("${local.folder_dir}", "**/*.yaml") :
    trimsuffix(f, ".yaml") => yamldecode(file("${local.folder_dir}/${f}"))
  }
  folder_dir = var.folder_dir
}

module "folders" {
  source   = "./modules/folder"
  for_each = local.folders_file
  parent   = var.parent
  names = [
    "${try(each.value.name, null)}"
  ]
}


