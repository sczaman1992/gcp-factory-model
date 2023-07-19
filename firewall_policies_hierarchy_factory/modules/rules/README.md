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
| [google_compute_firewall_policy_rule.policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | List of firewall policy rule definitions . | <pre>map(object({<br>    policy_rule_description             = optional(string)<br>    policy_rule_priority                = number<br>    policy_rule_enable_logging          = optional(bool, true)<br>    policy_rule_action                  = string<br>    policy_rule_direction               = string<br>    policy_rule_disabled                = optional(bool, true)<br>    policy_rule_target_resources        = optional(list(string))<br>    policy_rule_target_service_accounts = optional(list(string))<br>    match = optional(object({<br>      layer4_configs = optional(object({<br>        ip_protocol = optional(string)<br>        ports       = optional(list(string))<br>      }))<br>      dest_ip_ranges = optional(list(string))<br>      src_ip_ranges  = optional(list(string))<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_firewall_policy"></a> [firewall\_policy](#input\_firewall\_policy) | The firewall policy ID of the association. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the resource. |
<!-- END_TF_DOCS -->