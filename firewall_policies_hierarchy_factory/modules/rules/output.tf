output "id" {
  description = "The unique identifier for the resource."
  value = {
    for k, v in google_compute_firewall_policy_rule.policy_rule : k => v.id
  }
}