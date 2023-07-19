# Network Firewall Policies Terraform Factory Module
This module utilizes YAML configuration to create Network Firewall Policies.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
network_policy:
  policy_name: "global-firewall-policy"
  project: "bootstrap-wip-sa"
  policy_description: "org firewall policy"
  region: null
  association:
    g-bootstrap-wip-sa-vpc-red:
      policy_association_target: "vpc-red"
    g-bootstrap-wip-sa-vpc-amber:
      policy_association_target: "vpc-amber"
  custom_rules:
    g-orgfp-allow-ingress-inbound:
      policy_rule_description: "allow inbound"
      policy_rule_priority: 1000
      policy_rule_enable_logging: true
      policy_rule_action: "allow"
      policy_rule_direction: "INGRESS"
      policy_rule_disabled: false
      target_secure_tags:
        name: "tagValues/tag1"
      match:
        layer4_configs:
          ip_protocol: "tcp"
          ports: ["22","443"]
        src_secure_tags: 
          name: "tagValues/tag3"
        dest_ip_ranges:
          - "192.0.0.0"
          - "221.0.0.0"
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
| <a name="module_custom_rules"></a> [custom\_rules](#module\_custom\_rules) | ./modules/rules | n/a |
| <a name="module_firewall_policy"></a> [firewall\_policy](#module\_firewall\_policy) | ./modules/policy | n/a |
| <a name="module_policy_association"></a> [policy\_association](#module\_policy\_association) | ./modules/association | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_dir"></a> [firewall\_dir](#input\_firewall\_dir) | firewall directory path (ie. sample-data/) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_rules"></a> [custom\_rules](#output\_custom\_rules) | custom rules id. |
| <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy) | firewall policy id. |
| <a name="output_policy_association"></a> [policy\_association](#output\_policy\_association) | policy association id. |
<!-- END_TF_DOCS -->