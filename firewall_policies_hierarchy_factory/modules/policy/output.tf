output "id" {
  description = "The unique identifier for the resource."
  value       = google_compute_firewall_policy.policy.firewall_policy_id
}

output "name" {
  description = "Name of the resource."
  value       = google_compute_firewall_policy.policy.name
}