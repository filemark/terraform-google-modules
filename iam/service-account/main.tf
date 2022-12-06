locals {
  all_projects = distinct(concat(var.cross_project_permission_project_ids, tolist([var.project_id])))

  proj_role_list = flatten([
    for proj in local.all_projects : [
      for role in setunion(var.roles, var.create_custom_role ? ["projects/${proj}/roles/${var.custom_role_name}"] : []) : {
        project = proj
        role    = role
      }
    ]
  ])

  account_id = join("-", compact(tolist([var.environment, var.account_id])))
}

resource "google_service_account" "this" {
  account_id = local.account_id

  project      = var.project_id
  display_name = coalesce(var.display_name, var.account_id)
  description  = var.description
}

resource "google_service_account_key" "json_key" {
  count              = var.create_key ? 1 : 0
  service_account_id = google_service_account.this.account_id
}

module "cross_project_role" {
  source = "../cross-project-custom-role"
  count = var.create_custom_role ? 1 : 0

  project_id = var.project_id

  permissions = var.permissions
  projects    = local.all_projects
  role_name   = var.custom_role_name
  role_title  = var.custom_role_title
}

resource "google_project_iam_member" "role_set_membership" {
  for_each = {
    for entry in local.proj_role_list : "${entry.project}.${entry.role}" => entry
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.this.email}"

  depends_on = [module.cross_project_role, google_service_account.this]
}

data "google_iam_policy" "sa-policy" {
  dynamic "binding" {
    for_each = var.policy_roles

    content {
      role    = binding.value
      members = var.policy_members
    }
  }
}

resource "google_service_account_iam_policy" "this" {
  count = length(var.policy_members) > 0 ? 1 : 0

  service_account_id = google_service_account.this.name
  policy_data        = data.google_iam_policy.sa-policy.policy_data
}

locals {
  secrets = [
    var.add_email_as_secret ? {
      id : "${var.account_id}-service-account",
      data : google_service_account.this.email
    } : null,

    var.create_key ? {
      id : "${var.account_id}-key"
      data : var.decode_key_before_storing ? base64decode(google_service_account_key.json_key[0].private_key) : google_service_account_key.json_key[0].private_key
    } : null
  ]
}

module "secret" {
  source = "../../ssm-secret"

  for_each = {
    for secret in local.secrets: secret.id => secret if secret != null
  }

  environment = var.environment
  project_id  = var.project_id

  secret_id   = each.value.id
  secret_data = each.value.data

  depends_on = [google_service_account_key.json_key]
}
