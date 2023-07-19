
# variable "yaml_data" {
#   type = object({
#     essential_contacts = map(list(string))
#     folder_name        = string
#     name               = string
#     domain_prefix      = string
#     shared_vpc = optional(object(
#       {
#         enable_shared_vpc_host_project = optional(bool)
#         shared_vpc_subnets             = optional(list(string))
#         svpc_host_project_id           = optional(string)
#         shared_vpc_network_name        = optional(string)
#         shared_vpc_routing_mode        = optional(string)
#       }
#     ))
#     organization = object({
#       enable_lien          = bool
#       default_network_tier = string # PREMIUM | STANDARD
#       language_tag         = string
#       domain               = string
#     })
#     apis = object({
#       activate_apis               = list(string)
#       disable_services_on_destroy = bool
#       disable_dependent_services  = bool
#     })
#     iam_roles = object({
#       create_project_sa = bool
#       project_sa_name   = string
#     })
#   })
# }
# output "v_yaml_data" {
#   value = var.yaml_data
# }
