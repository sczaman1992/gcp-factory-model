output "core_project" {
  description = "Core Project Details"
  value       = module.core_project_factory
}

output "subnet_factory" {
  description = "Subnet Details"
  value       = module.subnet_factory
}

output "project_notification_channel" {
  description = "Project Notification Channel Details"
  value       = module.project_notification_channel
}

output "budget_factory" {
  description = "Budget Details"
  value       = module.budget_factory
}

output "service_account_factory" {
  description = "Service Account Details"
  value       = module.service_account_factory
}

output "anchor_folder_map" {
  description = "Anchor Folder Map"
  value       = local.anchor_folder_map
}

output "org_folders_map_byname" {
  description = "Organization Folder Map"
  value       = local.org_folders_map_byname
}