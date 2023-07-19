output "project_notification_channel" {
  description = "notification channel details"
  value       = module.project_notification_channel
}

output "name" {
  description = "notification channel name"
  value       = flatten([for v in module.project_notification_channel : v.name[*]])
}

output "display_name" {
  description = "notification channel display_name"
  value       = flatten([for v in module.project_notification_channel : v.display_name[*]])
}