output "project_name" {
  description = "Name of the project"
  value       = module.core_project_factory.project_name
}

output "project_id" {
  description = "ID of the project"
  value       = module.core_project_factory.project_id
}

output "project_number" {
  description = "Numeric identifier for the project"
  value       = module.core_project_factory.project_number
}

output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = module.core_project_factory.enabled_apis
}


