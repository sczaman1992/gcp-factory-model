# Workload Identity Provier Terraform Factory Module
This module utilizes YAML configuration to create Workload Identity Provier.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
workload_identity_provider_details:
  project_id: "project-a"
  workload_identity_pool_id: "example-pool"
  workload_identity_provider:
    tfc-provider:
      description: "terraform cloud provider"
      disabled: false
      hostname: "https://app.terraform.io"
      attribute_mapping:
        google.subject: "assertion.sub"
        attribute.aud: "assertion.aud"
      attribute_condition: "assertion.sub.startsWith()"
      allowed_audiences: ["https://allowed_audience"]
      service_account_id: "service-account-tfc"
      workload_pool_service_account_role: "roles/iam.workloadIdentityUser"
      workload_pool_service_account_member: "attribute.terraform_workspace_name/test-terraform-workspace"

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
| <a name="module_workload_identity_provider"></a> [workload\_identity\_provider](#module\_workload\_identity\_provider) | ./modules/workload_identity_provider | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | Project Number. | `string` | n/a | yes |
| <a name="input_provider_config_yamls"></a> [provider\_config\_yamls](#input\_provider\_config\_yamls) | Provider configuration YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workload_identity_provider"></a> [workload\_identity\_provider](#output\_workload\_identity\_provider) | Workload Identity Provider Details |
<!-- END_TF_DOCS -->