data "google_folders" "org_folders" {
  parent_id = "organizations/${var.org_id}"
}

data "google_folders" "anchor_folders" {
  parent_id = local.anchor_folder_id.name
}

locals {
  org_folders_list = data.google_folders.org_folders
  org_folders_map = {
    for k, v in local.org_folders_list.folders : v.display_name => v.name
  }
  org_folders_map_byname = {
    for k, v in local.org_folders_list.folders : v.display_name => v
  }
  anchor_folder_id    = local.org_folders_map_byname["${var.anchor_folder_name}"]
  anchor_folders_list = data.google_folders.anchor_folders
  anchor_folder_map = {
    for k, v in local.anchor_folders_list.folders : v.display_name => v.name
  }

}
