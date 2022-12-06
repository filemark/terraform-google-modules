output "roles" {
  value = {
    for role in google_project_iam_custom_role.custom_role : "${role.project}" => role.name
  }
}

output "role_name" {
  value = google_project_iam_custom_role.custom_role[*]
}
