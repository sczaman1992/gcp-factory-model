# Folder Terraform Factory Module
This module utilizes YAML configuration to create Folders.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
name: "desktop-anchor-folder"

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
| <a name="module_folders"></a> [folders](#module\_folders) | ./modules/folder | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_dir"></a> [folder\_dir](#input\_folder\_dir) | folder file path | `string` | n/a | yes |
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folders"></a> [folders](#output\_folders) | Folder Details |
| <a name="output_parent_id"></a> [parent\_id](#output\_parent\_id) | Parent ID |
<!-- END_TF_DOCS -->