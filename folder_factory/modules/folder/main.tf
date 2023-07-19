
locals {
  prefix       = var.prefix == "" ? "" : "${var.prefix}-"
  folders_list = [for name in var.names : try(google_folder.folders[name], "")]
  first_folder = try(local.folders_list[0], {})
}

resource "google_folder" "folders" {
  for_each     = toset(var.names)
  display_name = "${local.prefix}${each.value}"
  parent       = var.parent
}
