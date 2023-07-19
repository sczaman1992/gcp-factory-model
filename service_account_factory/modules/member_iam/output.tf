output "project_iam_member" {
  description = "Project Role Details"
  value       = resource.google_project_iam_member.project_iam_member
}

output "folder_iam_member" {
  description = "Folder Role Details"
  value       = resource.google_folder_iam_member.folder_iam_member
}

output "organization_iam_member" {
  description = "Org Role Details"
  value       = resource.google_organization_iam_member.organization_iam_member
}

output "member_iam_subnet" {
  description = "Subnet Role Details"
  value       = module.member_iam_subnet
}