resource "google_monitoring_dashboard" "ms_dashboard" {
  for_each       = var.dashboards
  project        = var.service_project_id
  dashboard_json = file(each.value.json_config)
}
