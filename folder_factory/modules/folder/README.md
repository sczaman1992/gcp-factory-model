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
| [google_folder.folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_names"></a> [names](#input\_names) | Folder names. | `list(string)` | `[]` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Optional prefix to enforce uniqueness of folder names. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder"></a> [folder](#output\_folder) | Folder resource (for single use). |
| <a name="output_folders"></a> [folders](#output\_folders) | Folder resources as list. |
| <a name="output_folders_map"></a> [folders\_map](#output\_folders\_map) | Folder resources by name. |
| <a name="output_id"></a> [id](#output\_id) | Folder id (for single use). |
| <a name="output_ids"></a> [ids](#output\_ids) | Folder ids. |
| <a name="output_ids_list"></a> [ids\_list](#output\_ids\_list) | List of folder ids. |
| <a name="output_name"></a> [name](#output\_name) | Folder name (for single use). |
| <a name="output_names"></a> [names](#output\_names) | Folder names. |
| <a name="output_names_list"></a> [names\_list](#output\_names\_list) | List of folder names. |
<!-- END_TF_DOCS -->