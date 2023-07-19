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
| <a name="module_member_iam_subnet"></a> [member\_iam\_subnet](#module\_member\_iam\_subnet) | ../member_iam_subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder_iam_member.folder_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_organization_iam_member.organization_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.project_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID | `string` | `null` | no |
| <a name="input_folder_roles"></a> [folder\_roles](#input\_folder\_roles) | List of Folder Roles | `list(string)` | `[]` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host Project ID | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | Organization ID | `string` | `null` | no |
| <a name="input_organization_roles"></a> [organization\_roles](#input\_organization\_roles) | List of Org Roles | `list(string)` | `[]` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_project_roles"></a> [project\_roles](#input\_project\_roles) | List of Project Roles | `list(string)` | `[]` | no |
| <a name="input_service_account_address"></a> [service\_account\_address](#input\_service\_account\_address) | Full Service Account Address ID | `string` | n/a | yes |
| <a name="input_sub_network"></a> [sub\_network](#input\_sub\_network) | Subnet Map | <pre>map(object({<br>    region = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_subnet_roles"></a> [subnet\_roles](#input\_subnet\_roles) | List of Subnet Roles | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_iam_member"></a> [folder\_iam\_member](#output\_folder\_iam\_member) | Folder Role Details |
| <a name="output_member_iam_subnet"></a> [member\_iam\_subnet](#output\_member\_iam\_subnet) | Subnet Role Details |
| <a name="output_organization_iam_member"></a> [organization\_iam\_member](#output\_organization\_iam\_member) | Org Role Details |
| <a name="output_project_iam_member"></a> [project\_iam\_member](#output\_project\_iam\_member) | Project Role Details |
<!-- END_TF_DOCS -->