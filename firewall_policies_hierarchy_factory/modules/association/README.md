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
| [google_compute_firewall_policy_association.policy_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy_association) | resource |
| [google_folders.anchor_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |
| [google_folders.org_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_folder_name"></a> [anchor\_folder\_name](#input\_anchor\_folder\_name) | Anchor Folder ID | `string` | n/a | yes |
| <a name="input_association"></a> [association](#input\_association) | A map of firewall policy associations | <pre>map(object({<br>    policy_association_target = string<br>  }))</pre> | n/a | yes |
| <a name="input_firewall_policy"></a> [firewall\_policy](#input\_firewall\_policy) | The firewall policy ID of the association. | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
<!-- END_TF_DOCS -->