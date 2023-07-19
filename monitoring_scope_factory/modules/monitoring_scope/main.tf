resource "google_monitoring_monitored_project" "monitoring_scope_primary" {
  for_each      = var.monitored_projects
  metrics_scope = var.metrics_scope_project_id
  name          = each.key
}