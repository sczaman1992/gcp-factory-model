

/******************************************
	Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "subnetwork" {
  for_each                   = var.subnets
  name                       = each.key
  ip_cidr_range              = each.value.ip_cidr_range
  region                     = each.value.region
  private_ip_google_access   = try(each.value.private_ip_google_access, "true")
  private_ipv6_google_access = try(each.value.private_ipv6_google_access, "true")
  dynamic "log_config" {
    for_each = try(each.value.flow_logs_enable, false) ? [{
      aggregation_interval = try(each.value.flow_logs.aggregation_interval, "INTERVAL_5_SEC")
      flow_sampling        = try(each.value.flow_logs.flow_sampling, "0.5")
      metadata             = try(each.value.flow_logs.metadata, "INCLUDE_ALL_METADATA")
      filter_expr          = try(each.value.flow_logs.filter_expr, "true")
    }] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
      filter_expr          = log_config.value.filter_expr
    }
  }
  network            = var.network_name
  project            = var.host_project_id
  description        = try(each.value.description, null)
  secondary_ip_range = each.value.secondary_ip_range

  purpose          = try(each.value.purpose, null)
  role             = try(each.value.role, null)
  stack_type       = try(each.value.stack, null)
  ipv6_access_type = try(each.value.ipv6_type, null)
}
