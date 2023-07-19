output "firewall_policy" {
  description = "firewall policy id."
  value = {
    for k, v in module.firewall_policy : k => {
      id      = v.id
      region  = v.region
      project = v.project
    }
  }
}

output "custom_rules" {
  description = "custom rules id."
  value = {
    for k, v in module.custom_rules : k => {
      id      = v.id
      region  = v.region
      project = v.project
    }
  }
}

output "policy_association" {
  description = "policy association id."
  value = {
    for k, v in module.policy_association : k => {
      id      = v.id
      region  = v.region
      project = v.project
    }
  }
}
