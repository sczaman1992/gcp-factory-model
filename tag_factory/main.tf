locals {
  tag_dir = var.tag_dir
  tag_config = {
    for f in fileset("${local.tag_dir}", "**/*.yaml") :
    yamldecode(file("${local.tag_dir}/${f}")).tag.tag_name => yamldecode(file("${local.tag_dir}/${f}")).tag
  }
}

module "tag" {
  source          = "./modules/tags"
  for_each        = local.tag_config
  parent          = each.value.parent
  tag_name        = each.value.tag_name
  tag_description = each.value.tag_description
  purpose         = each.value.purpose
  purpose_data = {
    network = each.value.purpose_data.network
  }
  tag_value = each.value.tag_value
}
