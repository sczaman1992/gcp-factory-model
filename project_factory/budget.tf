module "project_notification_channel" {
  source                = "../notification_channel_factory/modules/notification_channel"
  for_each              = local.notification_channel_config_map
  notification_channels = each.value.notification_channels
  service_project_id    = local.project_id
  depends_on = [
    module.core_project_factory
  ]
}

module "budget_factory" {
  source                 = "../budget_factory/modules/budget"
  for_each               = local.budget_alert_config_map
  budgets                = each.value.budgets
  billing_account        = var.billing_account
  service_project_id     = local.project_id
  service_project_number = local.project_number
  notification_channels  = module.project_notification_channel[each.key].name
  depends_on = [
    module.project_notification_channel,
    module.core_project_factory
  ]
}
