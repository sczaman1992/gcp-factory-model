resource "google_compute_subnetwork_iam_member" "member_iam_subnet" {
  for_each   = var.sub_network
  project    = var.host_project_id
  region     = each.value.region
  subnetwork = each.key
  role       = var.role
  member     = var.member
}
