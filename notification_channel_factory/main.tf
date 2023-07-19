locals {
  notification_channel_config = var.notification_channel_config_files
  notification_channel_config_map = {
    for f in fileset("${local.notification_channel_config}", "**/*.yaml") :
    yamldecode(file("${local.notification_channel_config}/${f}")).notification_channels_details.service_project_id => yamldecode(file("${local.notification_channel_config}/${f}")).notification_channels_details
  }
}

module "project_notification_channel" {
  source                = "./modules/notification_channel"
  for_each              = local.notification_channel_config_map
  notification_channels = each.value.notification_channels
  service_project_id    = each.value.service_project_id
}
