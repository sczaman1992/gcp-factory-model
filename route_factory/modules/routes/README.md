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
| [google_compute_route.route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network"></a> [network](#input\_network) | The ID of the network where routes will be created | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where routes will be created | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | Route Map | <pre>map(object({<br>    description            = optional(string),<br>    tags                   = optional(list(string)),<br>    dest_range             = optional(string),<br>    next_hop_gateway       = optional(string),<br>    next_hop_ip            = optional(string),<br>    next_hop_instance      = optional(string),<br>    next_hop_instance_zone = string,<br>    next_hop_vpn_tunnel    = optional(string),<br>    next_hop_ilb           = optional(string),<br>    priority               = optional(number),<br>    }<br>  ))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route"></a> [route](#output\_route) | Route Details |
<!-- END_TF_DOCS -->