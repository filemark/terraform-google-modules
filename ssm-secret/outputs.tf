output "full_secret_id" {
  value = google_secret_manager_secret.this.id
}

output "secret_id" {
  value = google_secret_manager_secret.this.secret_id
}

output "policy_id" {
  value = length(var.access_members) < 1 ? "" : google_secret_manager_secret_iam_policy.this[0].id
}

output "policy_access_members" {
  value = length(var.access_members) < 1 ? {} : {
    for role in var.policy_roles : role => var.access_members
  }
}

output "read_map" {
  description = "A map of the names and values read"
  value       = zipmap(local.name_list, local.value_list)
  sensitive   = true
}
