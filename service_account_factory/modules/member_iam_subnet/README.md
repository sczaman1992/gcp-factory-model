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
| [google_compute_subnetwork_iam_member.member_iam_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host Project ID | `string` | n/a | yes |
| <a name="input_member"></a> [member](#input\_member) | Service Account Member ID | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | Permission Roles | `string` | n/a | yes |
| <a name="input_sub_network"></a> [sub\_network](#input\_sub\_network) | Subnet Map | <pre>map(object({<br>    region = optional(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_member_iam_subnet"></a> [member\_iam\_subnet](#output\_member\_iam\_subnet) | Subnet Roles |
<!-- END_TF_DOCS -->