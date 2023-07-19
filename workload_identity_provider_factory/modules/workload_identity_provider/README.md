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
| [google_iam_workload_identity_pool.identity_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.identity_provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_service_account_iam_member.workload_pool_service_account_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID. | `string` | n/a | yes |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | Project Number. | `number` | n/a | yes |
| <a name="input_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#input\_workload\_identity\_pool\_id) | The name of workload identity pool | `string` | n/a | yes |
| <a name="input_workload_identity_provider"></a> [workload\_identity\_provider](#input\_workload\_identity\_provider) | n/a | <pre>map(object({<br>    hostname                             = string<br>    attribute_mapping                    = map(string)<br>    disabled                             = optional(bool, false)<br>    description                          = optional(string)<br>    attribute_condition                  = string<br>    allowed_audiences                    = list(string)<br>    service_account_id                   = string<br>    workload_pool_service_account_role   = string<br>    workload_pool_service_account_member = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_identity_pool"></a> [identity\_pool](#output\_identity\_pool) | Pool Details |
| <a name="output_identity_provider"></a> [identity\_provider](#output\_identity\_provider) | Provider ID |
| <a name="output_workload_pool_service_account_member"></a> [workload\_pool\_service\_account\_member](#output\_workload\_pool\_service\_account\_member) | Service Account Member Details |
<!-- END_TF_DOCS -->