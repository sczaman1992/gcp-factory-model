
output "id" {
  description = "The unique identifier for the resource."
  value       = var.region == null ? one(google_compute_network_firewall_policy.policy[*].network_firewall_policy_id) : one(google_compute_region_network_firewall_policy.policy[*].region_network_firewall_policy_id)
}

output "region" {
  description = "The location of this resource."
  value       = var.region
}

output "project" {
  description = "The project for the resource."
  value       = var.project
}