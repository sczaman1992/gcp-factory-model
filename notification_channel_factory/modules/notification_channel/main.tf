resource "google_monitoring_notification_channel" "notification_channel" {
  for_each     = var.notification_channels
  project      = var.service_project_id
  display_name = each.key
  type         = each.value.type
  enabled      = each.value.enabled
  description  = each.value.description
  user_labels  = each.value.user_labels
  labels       = each.value.labels
}
