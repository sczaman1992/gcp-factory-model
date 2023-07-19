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
| [google_compute_network_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy) | resource |
| [google_compute_region_network_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | Description of this resource. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name for an association. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project for the resource. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The location of this resource. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
| <a name="output_project"></a> [project](#output\_project) | The project for the resource. |
| <a name="output_region"></a> [region](#output\_region) | The location of this resource. |
<!-- END_TF_DOCS -->