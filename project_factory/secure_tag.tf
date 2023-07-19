# module "secure_tag" {
#   source          = "../tag_factory/modules/tag"
#   for_each        = local.tag_maps
#   parent          = "organizations/${var.org_id}"
#   tag_name        = each.value.tag_name
#   tag_description = each.value.tag_description
#   purpose         = each.value.purpose
#   purpose_data = {
#     network = each.value.purpose_data.network
#   }
#   tag_value = {
#     for tag, value in local.tag_maps[one([for k, v in local.projects : v.name])].tag_value : tag => {
#       tag_value_description = try(value.tag_value_description, null)
#       tag_binding           = "//cloudresourcemanager.googleapis.com/projects/${module.core_project_factory[one([for k, v in local.projects : v.name])].project_number}"
#       region                = try(value.region, null)
#     }
#   }
#   depends_on = [
#     module.core_project_factory
#   ]
# }