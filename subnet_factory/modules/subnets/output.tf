output "subnets" {
  description = "Subnet Details"
  value       = resource.google_compute_subnetwork.subnetwork
}
