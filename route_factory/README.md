# Route Terraform Factory Module
This module utilizes YAML configuration to create Network Routes.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
route_details:
  project_id: "host-prj-01"
  network: "example-vpc"
  routes:
    route-01a:
      description: "descriptio route-01a"
      tags: ["tag-a", "tag-b"]
      dest_range: "10.10.0.0/24"
      next_hop_gateway: "Interrnet Gateway"
      # next_hop_ip: "0.0.0.0/0"
      # next_hop_instance: "instance1"
      next_hop_instance_zone: "us-west1"
      # next_hop_vpn_tunnel: "vpn-897662"
      # next_hop_ilb: "llb-77773"
      priority: 10
    route-02a:
      description: "descriptio route-02a"
      tags: ["tag-ba", "tag-bc"]
      dest_range: "10.20.0.0/24"
      # next_hop_gateway: "Interrnet Gateway"
      next_hop_ip: "0.0.0.0/0"
      # next_hop_instance: "instance1"
      next_hop_instance_zone: "us-west1"
      # next_hop_vpn_tunnel: "vpn-b897662"
      # next_hop_ilb: "llb-b77773"
      priority: 9


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
| <a name="module_routes"></a> [routes](#module\_routes) | ./modules/routes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network"></a> [network](#input\_network) | The ID of the network where routes will be created | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where routes will be created | `string` | `null` | no |
| <a name="input_route_config_yamls"></a> [route\_config\_yamls](#input\_route\_config\_yamls) | route configuration YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_routes"></a> [routes](#output\_routes) | Route Details |
<!-- END_TF_DOCS -->