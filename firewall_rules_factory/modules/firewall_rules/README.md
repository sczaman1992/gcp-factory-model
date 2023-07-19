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
| [google_compute_firewall.custom](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | List of custom rule definitions (refer to variables file for syntax). | <pre>map(object({<br>    description        = optional(string)<br>    direction          = string<br>    action             = string # (allow|deny)<br>    ranges             = optional(list(string))<br>    source_ranges      = optional(list(string))<br>    destination_ranges = optional(list(string))<br>    source_tags        = optional(list(string))<br>    target_tags        = optional(list(string))<br>    rules = optional(list(object({<br>      protocol = optional(string)<br>      ports    = optional(list(string))<br>    })))<br>    extra_attributes = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_network"></a> [network](#input\_network) | Network ID. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id of the project that holds the network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_egress_allow_rules"></a> [custom\_egress\_allow\_rules](#output\_custom\_egress\_allow\_rules) | Custom egress rules with allow blocks. |
| <a name="output_custom_egress_deny_rules"></a> [custom\_egress\_deny\_rules](#output\_custom\_egress\_deny\_rules) | Custom egress rules with allow blocks. |
| <a name="output_custom_ingress_allow_rules"></a> [custom\_ingress\_allow\_rules](#output\_custom\_ingress\_allow\_rules) | Custom ingress rules with allow blocks. |
| <a name="output_custom_ingress_deny_rules"></a> [custom\_ingress\_deny\_rules](#output\_custom\_ingress\_deny\_rules) | Custom ingress rules with deny blocks. |
<!-- END_TF_DOCS -->