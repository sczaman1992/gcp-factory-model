resource "google_compute_route" "route" {
  for_each = var.routes

  project = var.project_id
  network = var.network

  name                   = each.key
  description            = each.value.description
  tags                   = each.value.tags
  dest_range             = each.value.dest_range
  next_hop_gateway       = each.value.next_hop_gateway
  next_hop_ip            = each.value.next_hop_ip
  next_hop_instance      = each.value.next_hop_instance
  next_hop_instance_zone = each.value.next_hop_instance_zone
  next_hop_vpn_tunnel    = each.value.next_hop_vpn_tunnel
  next_hop_ilb           = each.value.next_hop_ilb
  priority               = each.value.priority

}


