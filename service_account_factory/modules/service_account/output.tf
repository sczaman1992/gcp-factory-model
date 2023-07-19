output "service_accounts" {
  description = "Service Account"
  value       = resource.google_service_account.service_accounts
}

output "member_roles" {
  description = "Service Account Member Roles"
  value       = module.member_roles
}

output "service_account_id" {
  description = "Service Account ID"
  value       = flatten([for v in resource.google_service_account.service_accounts : v.id[*]])
}

output "service_account_member" {
  description = "Service Account Member ID"
  value       = flatten([for v in resource.google_service_account.service_accounts : v.member[*]])
}