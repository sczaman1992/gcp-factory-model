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
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | The ID of the project where subnets will be created | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network where subnets will be created | `string` | n/a | yes |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | The ID of the project where subnets will be created | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | <pre>map(object({<br>    description                = optional(string),<br>    region                     = string,<br>    purpose                    = optional(string),<br>    role                       = optional(string),<br>    stack                      = optional(string),<br>    ipv6_type                  = optional(string),<br>    ip_cidr_range              = string,<br>    private_ip_google_access   = optional(bool),<br>    private_ipv6_google_access = optional(bool),<br>    flow_logs_enable           = optional(bool),<br>    flow_logs = optional(object({<br>      aggregation_interval = optional(string),<br>      flow_sampling        = optional(string),<br>      metadata             = optional(string),<br>      filter_expr          = optional(string),<br>    }))<br>    secondary_ip_range = optional(list(object({<br>      range_name    = optional(string),<br>      ip_cidr_range = optional(string)<br>    })))<br>    }<br>  ))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Subnet Details |
<!-- END_TF_DOCS -->