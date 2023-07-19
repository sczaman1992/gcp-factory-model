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
| [google_compute_network_firewall_policy_association.association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_association) | resource |
| [google_compute_region_network_firewall_policy_association.association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_firewall_policy_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_association"></a> [association](#input\_association) | A map of firewall policy associations | <pre>map(object({<br>    policy_association_target = string<br>  }))</pre> | n/a | yes |
| <a name="input_firewall_policy"></a> [firewall\_policy](#input\_firewall\_policy) | The firewall policy ID of the association. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project for the resource. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The location of this resource. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
| <a name="output_project"></a> [project](#output\_project) | The project for the resource. |
| <a name="output_region"></a> [region](#output\_region) | The location of this resource. |
<!-- END_TF_DOCS -->