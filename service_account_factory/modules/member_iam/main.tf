locals {
  project_roles_map      = { for v in try(distinct(var.project_roles), []) : v => v }
  folder_roles_map       = { for v in try(distinct(var.folder_roles), []) : v => v }
  organization_roles_map = { for v in try(distinct(var.organization_roles), []) : v => v }
  subnet_roles_map       = { for v in try(distinct(var.subnet_roles), []) : v => v }
}
resource "google_project_iam_member" "project_iam_member" {
  for_each = local.project_roles_map
  project  = var.project_id
  role     = each.value
  member   = "${var.prefix}:${var.service_account_address}"
}
resource "google_folder_iam_member" "folder_iam_member" {
  for_each = local.folder_roles_map
  folder   = var.folder_id
  role     = each.value
  member   = "${var.prefix}:${var.service_account_address}"
}
resource "google_organization_iam_member" "organization_iam_member" {
  for_each = local.organization_roles_map
  org_id   = var.organization_id
  role     = each.value
  member   = "${var.prefix}:${var.service_account_address}"
}

module "member_iam_subnet" {
  for_each        = local.subnet_roles_map
  source          = "../member_iam_subnet"
  host_project_id = var.host_project_id
  sub_network     = var.sub_network
  role            = each.value
  member          = "${var.prefix}:${var.service_account_address}"
}
