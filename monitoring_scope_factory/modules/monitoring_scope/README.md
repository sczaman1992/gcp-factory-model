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
| [google_monitoring_monitored_project.monitoring_scope_primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_monitored_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metrics_scope_project_id"></a> [metrics\_scope\_project\_id](#input\_metrics\_scope\_project\_id) | Logging Project ID. | `string` | n/a | yes |
| <a name="input_monitored_projects"></a> [monitored\_projects](#input\_monitored\_projects) | Monitoring Project IDs. | `map(object({}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitoring_projects "></a> [monitoring\_projects ](#output\_monitoring\_projects ) | Monitored Projects Details |
<!-- END_TF_DOCS -->