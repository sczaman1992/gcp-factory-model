locals {
  budget_alert_config = var.budget_alert_config_files
  budget_alert_config_map = {
    for f in fileset("${local.budget_alert_config}", "**/*.yaml") :
    yamldecode(file("${local.budget_alert_config}/${f}")).budget_details.service_project_id => yamldecode(file("${local.budget_alert_config}/${f}")).budget_details
  }
}

module "budget_factory" {
  source                 = "./modules/budget"
  for_each               = local.budget_alert_config_map
  budgets                = each.value.budgets
  billing_account        = each.value.billing_account
  service_project_id     = try(each.value.service_project_id, var.service_project_id)
  service_project_number = var.service_project_number
}

