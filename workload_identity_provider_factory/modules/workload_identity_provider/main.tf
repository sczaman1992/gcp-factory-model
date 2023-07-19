
resource "google_iam_workload_identity_pool" "identity_pool" {
  project                   = var.project_id
  workload_identity_pool_id = var.workload_identity_pool_id
}

resource "google_iam_workload_identity_pool_provider" "identity_provider" {
  for_each                           = var.workload_identity_provider
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.identity_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = each.key
  description                        = each.value.description
  disabled                           = each.value.disabled
  attribute_mapping                  = each.value.attribute_mapping
  oidc {
    issuer_uri        = each.value.hostname
    allowed_audiences = each.value.allowed_audiences
  }
  attribute_condition = each.value.attribute_condition
}


resource "google_service_account_iam_member" "workload_pool_service_account_member" {
  for_each           = var.workload_identity_provider
  service_account_id = "projects/${var.project_id}/serviceAccounts/${each.value.service_account_id}@${var.project_id}.iam.gserviceaccount.com"
  role               = each.value.workload_pool_service_account_role
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.identity_pool.workload_identity_pool_id}/${each.value.workload_pool_service_account_member}"

}




