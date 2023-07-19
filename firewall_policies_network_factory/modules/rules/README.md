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
| [google_compute_network_firewall_policy_rule.policy_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_rule) | resource |
| [google_compute_region_network_firewall_policy_rule.policy_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_firewall_policy_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | List of firewall policy rule definitions . | <pre>map(object({<br>    policy_rule_description    = optional(string)<br>    policy_rule_priority       = number<br>    policy_rule_enable_logging = optional(bool, true)<br>    policy_rule_action         = string<br>    policy_rule_direction      = string<br>    policy_rule_disabled       = optional(bool, true)<br>    target_secure_tags = optional(object({<br>      name = optional(string)<br>    }))<br>    match = optional(object({<br>      layer4_configs = optional(object({<br>        ip_protocol = optional(string)<br>        ports       = optional(list(string))<br>      }))<br>      src_secure_tags = optional(object({<br>        name = optional(string)<br>      }))<br>      dest_ip_ranges = optional(list(string))<br>      src_ip_ranges  = optional(list(string))<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_firewall_policy"></a> [firewall\_policy](#input\_firewall\_policy) | The firewall policy ID of the association. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | project name. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The location of this resource. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
| <a name="output_project"></a> [project](#output\_project) | The project for the resource. |
| <a name="output_region"></a> [region](#output\_region) | The location of this resource. |
<!-- END_TF_DOCS -->