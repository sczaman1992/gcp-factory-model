# Custom Roles Terraform Factory Module
This module utilizes YAML configuration to create Custom Roles.


## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
custom_roles:
  OrgCustomRoleIam:
    - "iam.roles.list"
    - "iam.roles.create"
    - "iam.roles.delete"
  OrgCustomRoleResourceManager:
    - "resourcemanager.projects.get"
    - "resourcemanager.projects.getIamPolicy"

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
| [google_organization_iam_custom_role.org_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_custom_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_role_yaml"></a> [custom\_role\_yaml](#input\_custom\_role\_yaml) | n/a | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_roles"></a> [custom\_roles](#output\_custom\_roles) | Custom Roles Details |
<!-- END_TF_DOCS -->