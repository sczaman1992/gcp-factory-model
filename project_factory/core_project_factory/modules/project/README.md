## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.50, < 5.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 5.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.50, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_services"></a> [project\_services](#module\_project\_services) | ../project_services | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_shared_vpc_host_project.shared_vpc_host](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_shared_vpc_host_project) | resource |
| [google-beta_google_compute_shared_vpc_service_project.shared_vpc_attachment](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_shared_vpc_service_project) | resource |
| [google_project.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_default_service_accounts.default_service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |
| [google_resource_manager_lien.lien](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_lien) | resource |
| [google_service_account.default_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the default network | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_create_project_sa"></a> [create\_project\_sa](#input\_create\_project\_sa) | Whether the default service account for the project shall be created | `bool` | `true` | no |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"delete"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed | `bool` | `true` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. If true, you must *not* set shared\_vpc variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | If this project should be attached to a shared VPC. If true, you must set shared\_vpc variable. | `bool` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels for project | `map(string)` | `{}` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_project_sa_name"></a> [project\_sa\_name](#input\_project\_sa\_name) | Default service account name for the project. | `string` | `"project-service-account"` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | The ID of the host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of the project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Name of the project |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | Numeric identifier for the project |
| <a name="output_service_account_display_name"></a> [service\_account\_display\_name](#output\_service\_account\_display\_name) | The display name of the default service account |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the default service account |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | The id of the default service account |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The fully-qualified name of the default service account |
| <a name="output_service_account_unique_id"></a> [service\_account\_unique\_id](#output\_service\_account\_unique\_id) | The unique id of the default service account |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_services"></a> [project\_services](#module\_project\_services) | ../project_services | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_network_peering.vpc_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_project_default_network_tier.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_default_network_tier) | resource |
| [google_compute_shared_vpc_host_project.shared_vpc_host](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |
| [google_compute_shared_vpc_service_project.shared_vpc_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_project.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_default_service_accounts.default_service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |
| [google_resource_manager_lien.lien](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_lien) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the default network | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_default_network_tier"></a> [default\_network\_tier](#input\_default\_network\_tier) | Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers. | `string` | `""` | no |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"delete"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed | `bool` | `true` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. If true, you must *not* set shared\_vpc variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | If this project should be attached to a shared VPC. If true, you must set shared\_vpc variable. | `bool` | `false` | no |
| <a name="input_enable_vpc_peer"></a> [enable\_vpc\_peer](#input\_enable\_vpc\_peer) | If vpc peering is enabled = true | `bool` | `false` | no |
| <a name="input_export_custom_routes"></a> [export\_custom\_routes](#input\_export\_custom\_routes) | Whether to export the custom routes to the peer network. | `bool` | `false` | no |
| <a name="input_export_subnet_routes_with_public_ip"></a> [export\_subnet\_routes\_with\_public\_ip](#input\_export\_subnet\_routes\_with\_public\_ip) | Whether subnet routes with public IP range are exported. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | The name of the primary network for the peering. | `string` | n/a | yes |
| <a name="input_import_custom_routes"></a> [import\_custom\_routes](#input\_import\_custom\_routes) | Whether to import the custom routes to the peer network. | `bool` | `false` | no |
| <a name="input_import_subnet_routes_with_public_ip"></a> [import\_subnet\_routes\_with\_public\_ip](#input\_import\_subnet\_routes\_with\_public\_ip) | Whether subnet routes with public IP range are imported. | `bool` | `false` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | n/a | yes |
| <a name="input_peer_network"></a> [peer\_network](#input\_peer\_network) | The peer network in the peering. The peer network may belong to a different project. | `string` | n/a | yes |
| <a name="input_peer_project_id"></a> [peer\_project\_id](#input\_peer\_project\_id) | The peer network project id. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | The ID of the host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |
| <a name="input_vpc_peering_name"></a> [vpc\_peering\_name](#input\_vpc\_peering\_name) | Name of the peering. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of the project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Name of the project |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | Numeric identifier for the project |
| <a name="output_vpc_peering"></a> [vpc\_peering](#output\_vpc\_peering) | VPC peering connection |
<!-- END_TF_DOCS -->