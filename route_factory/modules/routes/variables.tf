variable "routes" {
  description = "Route Map"
  type = map(object({
    description            = optional(string),
    tags                   = optional(list(string)),
    dest_range             = optional(string),
    next_hop_gateway       = optional(string),
    next_hop_ip            = optional(string),
    next_hop_instance      = optional(string),
    next_hop_instance_zone = string,
    next_hop_vpn_tunnel    = optional(string),
    next_hop_ilb           = optional(string),
    priority               = optional(number),
    }
  ))
}
variable "project_id" {
  description = "The ID of the project where routes will be created"
  type        = string
}
variable "network" {
  description = "The ID of the network where routes will be created"
  type        = string
}
