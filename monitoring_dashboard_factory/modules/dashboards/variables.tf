
variable "dashboards" {
  type = map(object(
    {
      json_config = string
    }
  ))
}
variable "service_project_id" {
  type = string
}
