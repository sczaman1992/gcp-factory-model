resource "google_tags_tag_key" "key" {
  parent       = var.parent
  short_name   = var.tag_name
  description  = var.tag_description
  purpose      = var.purpose
  purpose_data = var.purpose_data
}

resource "google_tags_tag_value" "value" {
  for_each    = var.tag_value
  parent      = "tagKeys/${google_tags_tag_key.key.name}"
  short_name  = each.key
  description = each.value.tag_value_description
}