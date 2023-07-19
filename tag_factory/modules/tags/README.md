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
| [google_tags_tag_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_key) | resource |
| [google_tags_tag_value.value](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_value) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the new TagKey's parent | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | A purpose cannot be changed once set. A purpose denotes that this Tag is intended for use in policies of a specific policy engine, and will involve that policy engine in management operations involving this Tag | `string` | `null` | no |
| <a name="input_purpose_data"></a> [purpose\_data](#input\_purpose\_data) | Purpose data cannot be changed once set. Purpose data corresponds to the policy system that the tag is intended for. | `map(string)` | `null` | no |
| <a name="input_tag_description"></a> [tag\_description](#input\_tag\_description) | User-assigned description of the TagKey. | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | The user friendly name for a TagKey. | `string` | n/a | yes |
| <a name="input_tag_value"></a> [tag\_value](#input\_tag\_value) | Tag Value map that includes: Tag Value name, description and optional Tag Value Binding (ex.//cloudresourcemanager.googleapis.com/projects/*****), region optional | <pre>map(object({<br>    tag_value_description = optional(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tag_key"></a> [tag\_key](#output\_tag\_key) | Tag Key Details |
| <a name="output_tag_value"></a> [tag\_value](#output\_tag\_value) | Tag Value Details |
<!-- END_TF_DOCS -->