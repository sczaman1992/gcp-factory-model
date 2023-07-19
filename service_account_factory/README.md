# Service Account Terraform Factory Module
This module utilizes YAML configuration to create Service Accounts with specified roles at the following levels. Note: Each level of permissions is optional.
1. Organization
2. Folder
3. Project
4. Subnet

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
service_account_details:
  project_id: "dev-project-a"
  folder_id: "dev"
  organization_id: "76544333"
  service_accounts:
    my-web:
      project_roles:
        - roles/pubsub.admin
        - roles/compute.admin
      folder_roles:
        - roles/resourcemanager.folderAdmin
      organization_roles:
        - roles/orgpolicy.policyAdmin
      subnet_roles:
        - "roles/compute.networkUser"
    dev-admin:
      project_roles:
        - roles/compute.admin
        - roles/pubsub.admin
      folder_roles:
        - roles/resourcemanager.folderAdmin
      organization_roles:
        - roles/orgpolicy.policyAdmin
      subnet_roles:
        - "roles/compute.networkUser"
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
| [google_project_iam_member.project_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.app_service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `null` | no |
| <a name="input_yamlconfig_dir"></a> [yamlconfig\_dir](#input\_yamlconfig\_dir) | n/a | `string` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | ./modules/service_account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host Project ID | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Service account prefix. | `string` | `null` | no |
| <a name="input_sub_network"></a> [sub\_network](#input\_sub\_network) | Subnet Map | <pre>map(object({<br>    region = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_yamlconfig_dir"></a> [yamlconfig\_dir](#input\_yamlconfig\_dir) | Service account YAML directory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | Service Account ID |
<!-- END_TF_DOCS -->