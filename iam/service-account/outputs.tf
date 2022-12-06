
output "service_account_json_key" {
  value     = var.create_key && var.output_key ? google_service_account_key.json_key[0].private_key : ""
  sensitive = true
}

output "account_id" {
  value = local.account_id
}

output "email" {
  value = google_service_account.this.email
}

output "id" {
  value = google_service_account.this.id
}

output "name" {
  value = google_service_account.this.name
}

output "users_allowed_access" {
  value = length(var.policy_members) > 0 ? var.policy_members : ["warning: all users!"]
}

output "projects_affected" {
  value = local.all_projects
}

output "assigned_roles" {
  value = {
    for proj in local.all_projects : "${proj}" => [
      for entry in local.proj_role_list : entry.role if entry.project == proj
    ]
  }
}

output "custom_role_created" {
  value = length(var.permissions) > 0
}

output "secret_ids" {
  value = try(flatten(module.secret.*.secret_id), [])
}

output "custom_role" {
  value = length(var.permissions) == 0 ? [] : [{
    name : var.custom_role_name
    projects : length(var.permissions) > 0 ? var.cross_project_permission_project_ids : []
    roles : var.permissions
  }]
}
