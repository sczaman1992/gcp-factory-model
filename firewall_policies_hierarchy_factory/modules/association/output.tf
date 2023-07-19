output "id" {
  description = "The unique identifier for the resource."
  value = {
    for k, v in google_compute_firewall_policy_association.policy_association : k => v.id
  }
}