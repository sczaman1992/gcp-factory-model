output "tag_key" {
  description = "Tag Key Details"
  value       = resource.google_tags_tag_key.key
}

output "tag_value" {
  description = "Tag Value Details"
  value       = resource.google_tags_tag_value.value
}