# Organization Policies Terraform Factory Module
This module utilizes YAML configuration to create Organization Policies at Organization and Folder level.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
org_policies:
  bigquery.disableBQOmniAzure:
    rules:
      - enforce: true

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
| [google_org_policy_policy.org_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/org_policy_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_policies"></a> [org\_policies](#input\_org\_policies) | Organization policies applied to this project keyed by policy name. | <pre>map(object({<br>    inherit_from_parent = optional(bool) # for list policies only.<br>    reset               = optional(bool)<br>    rules = optional(list(object({<br>      allow = optional(object({<br>        all    = optional(bool)<br>        values = optional(list(string))<br>      }))<br>      deny = optional(object({<br>        all    = optional(bool)<br>        values = optional(list(string))<br>      }))<br>      enforce = optional(bool) # for boolean policies only.<br>      condition = optional(object({<br>        description = optional(string)<br>        expression  = optional(string)<br>        location    = optional(string)<br>        title       = optional(string)<br>      }), {})<br>    })), [])<br>  }))</pre> | `{}` | no |
| <a name="input_org_policies_data_path"></a> [org\_policies\_data\_path](#input\_org\_policies\_data\_path) | Path containing org policies in YAML format. | `string` | `null` | no |
| <a name="input_org_policies_file_path"></a> [org\_policies\_file\_path](#input\_org\_policies\_file\_path) | file Path containing org policies in YAML format. | `string` | `null` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | Parent ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_org_policies"></a> [org\_policies](#output\_org\_policies) | Organization Policies |
<!-- END_TF_DOCS -->