output "id" {
  description = "The unique identifier for the resource."
  value       = var.region == null ? [{ for k, v in google_compute_network_firewall_policy_rule.policy_rules : k => v.id }] : [{ for k, v in google_compute_region_network_firewall_policy_rule.policy_rules : k => v.id }]
}

output "region" {
  description = "The location of this resource."
  value       = var.region
}

output "project" {
  description = "The project for the resource."
  value       = var.project
}