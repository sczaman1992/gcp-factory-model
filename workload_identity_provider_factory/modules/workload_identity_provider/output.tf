output "identity_pool" {
  description = "Pool Details"
  value       = resource.google_iam_workload_identity_pool.identity_pool
}

output "identity_provider" {
  description = "Provider ID"
  value       = resource.google_iam_workload_identity_pool_provider.identity_provider
}

output "workload_pool_service_account_member" {
  description = "Service Account Member Details"
  value       = resource.google_service_account_iam_member.workload_pool_service_account_member
}
