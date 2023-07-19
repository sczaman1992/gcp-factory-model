output "monitoring_alert_output" {
  description = "Monitoring Alert Details"
  value       = resource.google_monitoring_alert_policy.monitoring_alert_factory
}