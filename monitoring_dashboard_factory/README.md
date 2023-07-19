# Monitoring Dashboard Terraform Module
This module uses JSON format to create Monitoring Dashboards.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
{
  "dashboardFilters": [],
  "displayName": "firewall_dropped_bytes_dashboard",
  "mosaicLayout": {
    "columns": 2,
    "tiles": [
      {
        "height": 2,
        "widget": {
          "title": "Dropped bytes [MEAN]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_RATE"
                    },
                    "filter": "metric.type=\"compute.googleapis.com/firewall/dropped_bytes_count\" resource.type=\"gce_instance\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_MEAN"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 2
      }
    ]
  }
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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_dashboards"></a> [project\_dashboards](#module\_project\_dashboards) | ./modules/dashboards | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_config_files"></a> [dashboard\_config\_files](#input\_dashboard\_config\_files) | dispaly name and path to the JSON file containing dashboard configuration | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_dashboards"></a> [project\_dashboards](#output\_project\_dashboards) | Project Dashboard Details |
<!-- END_TF_DOCS -->