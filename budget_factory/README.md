# Budget Factory Terraform Factory Module
This module utilizes YAML configuration to create Budgets.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
budget_details:
  service_project_id: "shared-infra-logging"
  billing_account: "01C49A-22222-A19CC4"
  budgets:
    budget-svc-prj-subnet-01:
      budget_filter:
        credit_types_treatment: "INCLUDE_ALL_CREDITS"   #Possible values are INCLUDE_ALL_CREDITS or EXCLUDE_ALL_CREDITS
        services: null
        calendar_period: null # Exactly one calender_period or custom_period must be provided. Possible values are MONTH, QUARTER, YEAR, CALENDAR_PERIOD_UNSPECIFIED
        custom_period: # Exactly one calender_period or custom_period must be provided.
          start_date:
            day: 01
            month: 01
            year: 2020
          end_date:
            day: 01
            month: 01
            year: 2022
      amount:
        specified_amount:
          currency_code: "USD"
          currency_amount: 1000
      threshold_rules:
        alert_spent_percents: 0.5
        alert_spend_basis: "CURRENT_SPEND" # possible values are FORECASTED_SPEND or CURRENT_SPEND
      all_updates_rule:
        alert_pubsub_topic: "test_pubsub_topic"
        monitoring_notification_channels: ["test_notification"]
```
## Where should I store my Terraform state?

Terraform state be stored on Google Cloud Storage or Terraform Cloud.

```hcl
terraform {
  backend "gcs" {
    bucket  = "tf-state-projects"
    prefix  = "terraform/state/team1"
  }
}

terraform {
  cloud {
    organization = "tf-org"
    workspaces {
      name = "tf-workspace"
    }
  }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget_factory"></a> [budget\_factory](#module\_budget\_factory) | ./modules/budget | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_alert_config_files"></a> [budget\_alert\_config\_files](#input\_budget\_alert\_config\_files) | configuration yaml files path for budget alert | `string` | n/a | yes |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | Project ID. | `string` | `null` | no |
| <a name="input_service_project_number"></a> [service\_project\_number](#input\_service\_project\_number) | Project Number | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_factory"></a> [budget\_factory](#output\_budget\_factory) | Budget Factory Details |
<!-- END_TF_DOCS -->