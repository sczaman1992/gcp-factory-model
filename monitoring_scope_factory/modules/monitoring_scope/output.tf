output "monitoring_projects " {
  description = "Monitored Projects Details"
  value       = resource.google_monitoring_monitored_project.monitoring_scope_primary
}
