# Monitoring Scope Terraform Factory Module
This module utilizes YAML configuration to create Monitoring Scopes.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
monitoring_scope_details:
  metrics_scope_project_id: "svc-prj-subnet-01"
  monitored_projects:
    my-monitored-project1:
    my-monitored-project2:

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
| <a name="module_monitoring_scope"></a> [monitoring\_scope](#module\_monitoring\_scope) | ./modules/monitoring_scope | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitoring_scope_config_files"></a> [monitoring\_scope\_config\_files](#input\_monitoring\_scope\_config\_files) | monitoring project scope configs | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitoring_scope"></a> [monitoring\_scope](#output\_monitoring\_scope) | Monitoring Scope Details |
<!-- END_TF_DOCS -->