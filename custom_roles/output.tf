output "custom_roles" {
  description = "Custom Roles Details"
  value       = resource.google_organization_iam_custom_role.org_custom_role
}
