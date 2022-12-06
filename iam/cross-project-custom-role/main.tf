resource "google_project_iam_custom_role" "custom_role" {
  for_each = coalesce(var.projects, toset([var.project_id]))

  project     = each.value
  role_id     = var.role_name
  title       = var.role_title
  description = var.role_description
  permissions = var.permissions
}
