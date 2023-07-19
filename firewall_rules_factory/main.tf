locals {

  firewall_rules = {
    for f in fileset("${local.firewall_dir}", "**/*.yaml") :
    yamldecode(file("${local.firewall_dir}/${f}")).firewall_rule.network => yamldecode(file("${local.firewall_dir}/${f}")).firewall_rule
  }

  firewall_dir = var.firewall_dir

}

