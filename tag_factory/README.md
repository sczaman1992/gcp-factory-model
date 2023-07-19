# Secure Tag Terraform Factory Module
This module utilizes YAML configuration to create Secure Tags.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
tag:
  tag_name: "Environment"
  parent: "organizations/51222104475" #projects/project_id
  tag_description: "environment tags"
  purpose: "GCE_FIREWALL"
  purpose_data:
    network: "bootstrap-wip-sa/default"
  tag_value:
    dev: 
      tag_value_description: "tag value dev"
    prod: 
      tag_value_description: "tag value prod"
  
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
| <a name="module_tag"></a> [tag](#module\_tag) | ./modules/tags | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tag_dir"></a> [tag\_dir](#input\_tag\_dir) | tag YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_tag"></a> [module\_tag](#output\_module\_tag) | Tag Details |
<!-- END_TF_DOCS -->