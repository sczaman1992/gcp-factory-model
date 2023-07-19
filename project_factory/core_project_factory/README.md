<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_core_project_factory"></a> [core\_project\_factory](#module\_core\_project\_factory) | ./modules/project | n/a |
| <a name="module_shared_vpc_dns"></a> [shared\_vpc\_dns](#module\_shared\_vpc\_dns) | ./modules/cloud_dns | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc_network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | `[]` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_default_network_tier"></a> [default\_network\_tier](#input\_default\_network\_tier) | Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers. | `string` | `""` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name (optional). | `string` | `""` | no |
| <a name="input_domain_prefix"></a> [domain\_prefix](#input\_domain\_prefix) | The prefix of domain. Example : project1, sharedvpc | `string` | `null` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. If true, you must *not* set svpc\_host\_project\_id variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | If this project is a shared VPC service project. If true, you must set svpc\_host\_project\_id variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_vpc_peer"></a> [enable\_vpc\_peer](#input\_enable\_vpc\_peer) | If vpc peering is enabled = true | `bool` | `false` | no |
| <a name="input_essential_contacts"></a> [essential\_contacts](#input\_essential\_contacts) | A mapping of users or groups to be assigned as Essential Contacts to the project, specifying a notification category | `map(list(string))` | `{}` | no |
| <a name="input_export_custom_routes"></a> [export\_custom\_routes](#input\_export\_custom\_routes) | Whether to export the custom routes to the peer network. | `bool` | `false` | no |
| <a name="input_export_subnet_routes_with_public_ip"></a> [export\_subnet\_routes\_with\_public\_ip](#input\_export\_subnet\_routes\_with\_public\_ip) | Whether subnet routes with public IP range are exported. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_grant_network_role"></a> [grant\_network\_role](#input\_grant\_network\_role) | Whether or not to grant networkUser role on the host project/subnets | `bool` | `true` | no |
| <a name="input_grant_services_security_admin_role"></a> [grant\_services\_security\_admin\_role](#input\_grant\_services\_security\_admin\_role) | Whether or not to grant Kubernetes Engine Service Agent the Security Admin role on the host project so it can manage firewall rules | `bool` | `false` | no |
| <a name="input_import_custom_routes"></a> [import\_custom\_routes](#input\_import\_custom\_routes) | Whether to import the custom routes to the peer network. | `bool` | `false` | no |
| <a name="input_import_subnet_routes_with_public_ip"></a> [import\_subnet\_routes\_with\_public\_ip](#input\_import\_subnet\_routes\_with\_public\_ip) | Whether subnet routes with public IP range are imported. | `bool` | `false` | no |
| <a name="input_language_tag"></a> [language\_tag](#input\_language\_tag) | Language code to be used for essential contacts notifications | `string` | `"en-US"` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | n/a | yes |
| <a name="input_peer_network"></a> [peer\_network](#input\_peer\_network) | The peer network in the peering. The peer network may belong to a different project. | `string` | n/a | yes |
| <a name="input_peer_project_id"></a> [peer\_project\_id](#input\_peer\_project\_id) | The peer network project id. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_shared_vpc_network_name"></a> [shared\_vpc\_network\_name](#input\_shared\_vpc\_network\_name) | VPC network to be created for shared vpc project | `string` | `null` | no |
| <a name="input_shared_vpc_routing_mode"></a> [shared\_vpc\_routing\_mode](#input\_shared\_vpc\_routing\_mode) | The network-wide routing mode to use. | `string` | `"REGIONAL"` | no |
| <a name="input_svpc_host_project_id"></a> [svpc\_host\_project\_id](#input\_svpc\_host\_project\_id) | The ID of the host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_vpc_peering_name"></a> [vpc\_peering\_name](#input\_vpc\_peering\_name) | Name of the peering. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of the project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Name of the project |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | Numeric identifier for the project |
<!-- END_TF_DOCS -->