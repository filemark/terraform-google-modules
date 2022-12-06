resource "google_secret_manager_secret" "this" {
  secret_id = replace(join("_", compact([var.environment, var.secret_id])), "-", "_")

  labels = var.secret_labels
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "this" {
  secret      = google_secret_manager_secret.this.id
  secret_data = var.secret_data

  depends_on = [google_secret_manager_secret.this]
}

data "google_iam_policy" "secret_accessor" {
  dynamic "binding" {
    for_each = var.policy_roles

    content {
      role    = binding.value
      members = var.access_members
    }
  }
}

resource "google_secret_manager_secret_iam_policy" "this" {
  count = length(var.access_members) > 0 ? 1 : 0

  secret_id   = google_secret_manager_secret.this.id
  policy_data = data.google_iam_policy.secret_accessor.policy_data

  depends_on = [google_secret_manager_secret.this]
}
