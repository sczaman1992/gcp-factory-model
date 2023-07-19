# Notification Channel Terraform Factory Module
This module utilizes YAML configuration to create Notification Channels.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
notification_channels_details:
  service_project_id: "svc-prj-subnet-01"
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
    pubsub_notification_channel:
      type: "pubsub"
      labels:
        topic_name: "mytopic"
      enabled: true
      description: "pubsub_notification_channel"
      user_labels:
        key1: "topic value1"
        key2: "topic value2"


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
| <a name="module_project_notification_channel"></a> [project\_notification\_channel](#module\_project\_notification\_channel) | ./modules/notification_channel | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_notification_channel_config_files"></a> [notification\_channel\_config\_files](#input\_notification\_channel\_config\_files) | notification channel details configuration yaml files | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | notification channel display\_name |
| <a name="output_name"></a> [name](#output\_name) | notification channel name |
| <a name="output_project_notification_channel"></a> [project\_notification\_channel](#output\_project\_notification\_channel) | notification channel details |
<!-- END_TF_DOCS -->