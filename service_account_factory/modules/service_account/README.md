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
| <a name="module_member_roles"></a> [member\_roles](#module\_member\_roles) | ../member_iam | n/a |

## Resources

| Name | Type |
|------|------|
| [google_service_account.service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID | `string` | `null` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host Project ID | `string` | `null` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | Organization ID | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | Service Account Role Map | <pre>map(object({<br>    project_roles      = optional(list(string))<br>    folder_roles       = optional(list(string))<br>    organization_roles = optional(list(string))<br>    subnet_roles       = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_sub_network"></a> [sub\_network](#input\_sub\_network) | Subnet Map | <pre>map(object({<br>    region = optional(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_member_roles"></a> [member\_roles](#output\_member\_roles) | Service Account Member Roles |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | Service Account ID |
| <a name="output_service_account_member"></a> [service\_account\_member](#output\_service\_account\_member) | Service Account Member ID |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | Service Account |
<!-- END_TF_DOCS -->