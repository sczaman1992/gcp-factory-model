output "notification_channel" {
  description = "notification channel details"
  value       = resource.google_monitoring_notification_channel.notification_channel
}

output "name" {
  description = "notification channel name"
  value       = flatten([for v in resource.google_monitoring_notification_channel.notification_channel : v.name[*]])
}

output "display_name" {
  description = "notification channel display_name"
  value       = flatten([for v in resource.google_monitoring_notification_channel.notification_channel : v.display_name[*]])
}