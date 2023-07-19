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
| [google_billing_budget.budget](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing Account ID | `string` | n/a | yes |
| <a name="input_budgets"></a> [budgets](#input\_budgets) | Budget Alert configuration details | <pre>map(object({<br>    budget_filter = optional(object({<br>      create_budget          = optional(bool, true)<br>      credit_types_treatment = optional(string)<br>      services               = optional(list(string))<br>      calendar_period        = optional(string)<br>      custom_period = optional(object({<br>        start_date = optional(object({<br>          day   = optional(number)<br>          month = optional(number)<br>          year  = optional(number)<br>        }))<br>        end_date = optional(object({<br>          day   = optional(number)<br>          month = optional(number)<br>          year  = optional(number)<br>        }))<br>      }))<br>    }))<br>    amount = optional(object({<br>      specified_amount = optional(object({<br>        currency_code   = string<br>        currency_amount = number<br>      }))<br>    }))<br>    threshold_rules = optional(object({<br>      alert_spent_percents = optional(number)<br>      alert_spend_basis    = optional(string)<br>    }))<br>    all_updates_rule = optional(object({<br>      alert_pubsub_topic               = optional(string)<br>      monitoring_notification_channels = optional(list(string))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification Channel Name | `list(string)` | `null` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | Project ID. | `string` | n/a | yes |
| <a name="input_service_project_number"></a> [service\_project\_number](#input\_service\_project\_number) | Project Number. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget"></a> [budget](#output\_budget) | Budget Details |
<!-- END_TF_DOCS -->