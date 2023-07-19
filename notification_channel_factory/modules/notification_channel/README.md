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
| [google_monitoring_notification_channel.notification_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification Channel Map | <pre>map(object({<br>    type        = string<br>    enabled     = optional(bool, true)<br>    description = optional(string, "created by terraform")<br>    user_labels = optional(map(string))<br>    labels      = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | Project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | notification channel display\_name |
| <a name="output_name"></a> [name](#output\_name) | notification channel name |
| <a name="output_notification_channel"></a> [notification\_channel](#output\_notification\_channel) | notification channel details |
<!-- END_TF_DOCS -->