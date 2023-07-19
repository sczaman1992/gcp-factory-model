
output "project_name" {
  description = "Name of the project"
  value       = google_project.main.name
}

output "project_id" {
  description = "ID of the project"
  value       = module.project_services.project_id
  depends_on = [
    module.project_services,
    google_project.main,
    google_compute_shared_vpc_service_project.shared_vpc_attachment,
    google_compute_shared_vpc_host_project.shared_vpc_host,
  ]
}

output "project_number" {
  description = "Numeric identifier for the project"
  value       = google_project.main.number
  depends_on  = [module.project_services]
}

output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = module.project_services.enabled_apis
}

output "vpc_peering" {
  value       = resource.google_compute_network_peering.vpc_peering
  description = "VPC peering connection"
}