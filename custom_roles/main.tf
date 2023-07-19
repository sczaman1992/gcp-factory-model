locals {
  custom_role_yaml   = var.custom_role_yaml
  custom_role_config = try(yamldecode(file("${local.custom_role_yaml}")).custom_roles, {})
}
resource "google_organization_iam_custom_role" "org_custom_role" {
  for_each    = local.custom_role_config
  org_id      = var.org_id
  role_id     = each.key
  title       = each.key
  description = "created by terraform"
  permissions = each.value
}