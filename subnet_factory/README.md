# Subnet Terraform Factory Module
This module utilizes YAML configuration to create Subnets.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
subnet_details:
  service_project_id: "svc-prj-subnet-01"
  host_project_id: "example-host-vpc"
  network_name: "example-vpc"
  subnets:
    subnet-01a:
      # name: "subnet-01a"
      description: "simple subnet test"
      ip_cidr_range: "10.10.10.0/24"
      region: "us-west1"
      # private_ip_google_access: "true"
      flow_logs_enable: "true"
      role: "ACTIVE"
      secondary_ip_range:
        - range_name: "subnet-01-secondary-01a"
          ip_cidr_range: "192.168.64.0/24"
        - range_name: "subnet-02-secondary-01a"
          ip_cidr_range: "192.168.65.0/24"
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
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/subnets | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host project ID | `string` | `null` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network ID | `string` | `null` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | Service project ID | `string` | `null` | no |
| <a name="input_subnet_config_yamls"></a> [subnet\_config\_yamls](#input\_subnet\_config\_yamls) | Subnet configuration YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Subnet Details |
<!-- END_TF_DOCS -->