variable "region" {}
variable "project_id" {}
variable "environment" {
  default = ""
}

variable "account_id" {}
variable "display_name" {
  default = ""
}
variable "description" {
  default = "Managed by terraform"
}

variable "cross_project_permission_project_ids" {
  type    = list(string)
  default = []
}

variable "create_custom_role" {
  default = false
}

variable "custom_role_name" {
  default = ""
}

variable "custom_role_title" {
  default = ""
}

variable "permissions" {
  type        = list(string)
  description = "List of permissions that aren't contained in any of the available roles. If not provided - only roles list will be applied to the service account"
  default     = []
}

variable "roles" {
  type    = set(string)
  default = []
}

variable "secret_id" {
  type    = string
  default = ""
}

variable "decode_key_before_storing" {
  default = false
}

variable "policy_members" {
  type    = list(string)
  default = []
}

variable "create_key" {
  default = false
}

variable "output_key" {
  description = "dont"
  default     = false
}

variable "add_email_as_secret" {
  description = "used in business apps for GKE Workload Identity"
  default     = false
}

variable "policy_roles" {
  type = list(string)
  default = [
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iam.serviceAccountUser",
  ]
  description = "Roles to assign to users regarding this service account. Complements local.all_users."
}

variable "sa_disabled" {
  default = false
}
