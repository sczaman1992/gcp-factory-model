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
| [google_monitoring_dashboard.ms_dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | n/a | <pre>map(object(<br>    {<br>      json_config = string<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ms_dashboard"></a> [ms\_dashboard](#output\_ms\_dashboard) | n/a |
<!-- END_TF_DOCS -->