# Monitoring Alert Terraform Module
This module uses JSON format to create Monitoring Alerts.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
{
    "displayName": "absent-test",
    "documentation": {
      "content": "hello",
      "mimeType": "text/markdown"
    },
    "userLabels": {
      "faf": "aedadf"
    },
    "conditions": [
      {
        "displayName": "VM Instance - CPU utilization",
        "conditionAbsent": {
          "filter": "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\"",
          "aggregations": [
            {
              "alignmentPeriod": "300s",
              "crossSeriesReducer": "REDUCE_NONE",
              "perSeriesAligner": "ALIGN_MEAN"
            }
          ],
          "duration": "300s",
          "trigger": {
            "count": 1
          }
        }
      },
      {
        "displayName": "VM Instance - CPU utilization- absence",
        "conditionAbsent": {
          "filter": "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\"",
          "aggregations": [
            {
              "alignmentPeriod": "300s",
              "crossSeriesReducer": "REDUCE_NONE",
              "perSeriesAligner": "ALIGN_MEAN"
            },
            {
              "alignmentPeriod": "300s",
              "crossSeriesReducer": "REDUCE_COUNT",
              "groupByFields": [
                "metric.label.instance_name"
              ],
              "perSeriesAligner": "ALIGN_NEXT_OLDER"
            }
          ],
          "duration": "900s",
          "trigger": {
            "percent": 100
          }
        }
      }
    ],
    "alertStrategy": {
      "autoClose": "604800s",
      "notificationRateLimit": {
        "period": "20s"
      },
      "notificationChannelStrategy": [
        {
          "notificationChannelNames": ["projects/[PROJECT_ID_OR_NUMBER]/notificationChannels/[CHANNEL_ID]"],
          "renotifyInterval": "20s"
        }
      ]
    },
    "combiner": "OR",
    "enabled": true,
    "project": "poc-and-training",
    "notificationChannels": ["test1","test2"]
  }
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

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.monitoring_alert_factory](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitoring_alert_config_dir"></a> [monitoring\_alert\_config\_dir](#input\_monitoring\_alert\_config\_dir) | monitoring alert config directory with json files | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitoring_alert_output"></a> [monitoring\_alert\_output](#output\_monitoring\_alert\_output) | Monitoring Alert Details |
<!-- END_TF_DOCS -->