locals {

  project_roles_maps = {
    for sa_name, roles in var.service_accounts : sa_name => roles.project_roles
    if can(roles.project_roles)
  }
  folder_roles_maps = {
    for sa_name, roles in var.service_accounts : sa_name => roles.folder_roles
    if can(roles.folder_roles)
  }
  organization_roles_maps = {
    for sa_name, roles in var.service_accounts : sa_name => roles.organization_roles
    if can(roles.organization_roles)
  }
  subnet_roles_maps = {
    for sa_name, roles in var.service_accounts : sa_name => roles.subnet_roles
    if can(roles.subnet_roles)
  }
}

resource "google_service_account" "service_accounts" {
  for_each     = var.service_accounts
  account_id   = lower(each.key)
  display_name = try(each.value.display_name, "")
  description  = try(each.value.description, "")
  project      = var.project_id
}


module "member_roles" {
  for_each                = resource.google_service_account.service_accounts
  source                  = "../member_iam"
  service_account_address = each.value.email
  prefix                  = "serviceAccount"
  project_id              = var.project_id
  folder_id               = var.folder_id
  organization_id         = var.organization_id
  sub_network             = try(var.sub_network, {})
  host_project_id         = var.host_project_id
  project_roles           = try(local.project_roles_maps[each.key], [])
  folder_roles            = try(local.folder_roles_maps[each.key], [])
  organization_roles      = try(local.organization_roles_maps[each.key], [])
  subnet_roles            = try(local.subnet_roles_maps[each.key], [])
}