# Firewall Rules Terraform Factory Module
This module utilizes YAML configuration to create Firewall Rules.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
firewall_rule:  
  project_id: "test-project-a"
  network: "dev-red-vpc"
  custom_rules:
    dev-red-vpc-fr-gcp-ingress-deny-onprem-gcp:
      description: "ingress onprem to gcp"
      direction: "INGRESS"
      action: "deny"
      target_tags:
        - "test-targets"
      source_tags:
        - "test-source"
      destination_ranges:
        - "172.0.0.0"
      rules:
        - protocol: "tcp"
          ports: ["22","443"] 
        - protocol: "udp"
          ports: ["53","889"]   
      extra_attributes:
        priority: 2000
        disabled: false
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
| <a name="module_firewall_rules"></a> [firewall\_rules](#module\_firewall\_rules) | ./modules/firewall_rules | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_dir"></a> [firewall\_dir](#input\_firewall\_dir) | Firewall rules path | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_rules"></a> [firewall\_rules](#output\_firewall\_rules) | Firewall Rule Details |
<!-- END_TF_DOCS -->