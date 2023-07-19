# Project Factory Module

This module is used to create the following resources:
1. Host or Service Project
2. API Activation
3. Shared VPC
4. VPC peering
5. Service Account (NOTE: Default Service Account is deleted by default)
6. Optional ( Budget Alert)
7. Optional ( Notification Channels)

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
project_details:
  name: "service-project-1"
  domain_prefix: "service-project-1-domain"
  folder_name: "dev-amber"
  apis:
    activate_apis:
      - "compute.googleapis.com"
      - "cloudkms.googleapis.com"
    disable_services_on_destroy: true
    disable_dependent_services: true
  shared_vpc:
    enable_shared_vpc_service_project: true
    svpc_host_project_id: "host-project-1"
    shared_vpc_network_name: "host-project-1-vpc"
service_account_details:
  service_accounts:
    host-project-sa:
      subnet_roles:
        - "roles/compute.networkUser"
subnet_details:
  subnets:
    subnet-01a:
      description: "simple subnet test"
      ip_cidr_range: "10.10.10.0/24"
      region: "us-central1"
      flow_logs_enable: "true"
      role: "ACTIVE"
      secondary_ip_range:
        - range_name: "subnet-01-secondary-01a"
          ip_cidr_range: "192.168.64.0/24"
        - range_name: "subnet-02-secondary-01a"
          ip_cidr_range: "192.169.65.0/24"
    subnet-01b:
      description: "simple subnet test2"
      ip_cidr_range: "10.20.10.0/24"
      region: "us-central1"
      flow_logs_enable: "true"
      role: "ACTIVE"
      secondary_ip_range:
        - range_name: "subnet-01-secondary-01b"
          ip_cidr_range: "192.170.64.0/24"
        - range_name: "subnet-02-secondary-01b"
          ip_cidr_range: "192.171.65.0/24"
notification_channels_details:
  notification_channels:
    email_notification_channel:
      type: "email"
      labels:
        email_address: "a1@abc.com"
      enabled: true
      description: "email_notification_channel"
      user_labels:
        key1: "value1"
        key2: "value2"
budget_details:
  billing_account: "1111-1111-1111-1111"
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
          currency_code: "US"
          currency_amount: 1000
      threshold_rules:
        alert_spent_percents: 0.5
        alert_spend_basis: "CURRENT_SPEND" # possible values are FORECASTED_SPEND or CURRENT_SPEND
      all_updates_rule:
        alert_pubsub_topic: "test_pubsub_topic"
        monitoring_notification_channels: []

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget_factory"></a> [budget\_factory](#module\_budget\_factory) | ../budget_factory/modules/budget | n/a |
| <a name="module_core_project_factory"></a> [core\_project\_factory](#module\_core\_project\_factory) | ./core_project_factory | n/a |
| <a name="module_project_notification_channel"></a> [project\_notification\_channel](#module\_project\_notification\_channel) | ../notification_channel_factory/modules/notification_channel | n/a |
| <a name="module_service_account_factory"></a> [service\_account\_factory](#module\_service\_account\_factory) | ../service_account_factory/modules/service_account | n/a |
| <a name="module_subnet_factory"></a> [subnet\_factory](#module\_subnet\_factory) | ../subnet_factory/modules/subnets | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folders.anchor_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |
| [google_folders.org_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_folder_name"></a> [anchor\_folder\_name](#input\_anchor\_folder\_name) | Anchor folder ID | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account ID. | `string` | `null` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID. | `string` | `null` | no |
| <a name="input_organization_yaml"></a> [organization\_yaml](#input\_organization\_yaml) | Organization YAML file location | `string` | n/a | yes |
| <a name="input_project_config_yamls"></a> [project\_config\_yamls](#input\_project\_config\_yamls) | Project YAML file location | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_anchor_folder_map"></a> [anchor\_folder\_map](#output\_anchor\_folder\_map) | Anchor Folder Map |
| <a name="output_budget_factory"></a> [budget\_factory](#output\_budget\_factory) | Budget Details |
| <a name="output_core_project"></a> [core\_project](#output\_core\_project) | Core Project Details |
| <a name="output_org_folders_map_byname"></a> [org\_folders\_map\_byname](#output\_org\_folders\_map\_byname) | Organization Folder Map |
| <a name="output_project_notification_channel"></a> [project\_notification\_channel](#output\_project\_notification\_channel) | Project Notification Channel Details |
| <a name="output_service_account_factory"></a> [service\_account\_factory](#output\_service\_account\_factory) | Service Account Details |
| <a name="output_subnet_factory"></a> [subnet\_factory](#output\_subnet\_factory) | Subnet Details |
<!-- END_TF_DOCS -->