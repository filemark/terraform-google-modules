data "google_secret_manager_secret_version" "read" {
  for_each = {
    for i, secret in var.secret_read : "${secret.secret}-${i}" => secret
  }

  secret  = each.value.secret
  project = each.value.project == null ? var.project_id : each.value.project
  version = each.value.version
}
