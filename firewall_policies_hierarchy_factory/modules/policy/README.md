<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy) | resource |
| [google_folders.anchor_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |
| [google_folders.org_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_folder_name"></a> [anchor\_folder\_name](#input\_anchor\_folder\_name) | Anchor Folder ID | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |
| <a name="input_parent"></a> [parent](#input\_parent) | The parent of the firewall policy. | `string` | n/a | yes |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | A description of this resource. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | User-provided name of the Organization firewall policy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
| <a name="output_name"></a> [name](#output\_name) | Name of the resource. |
<!-- END_TF_DOCS -->