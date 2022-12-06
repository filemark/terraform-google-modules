locals {
  name_list  = [for secr in var.secret_read : secr.secret]
  value_list = [for p in data.google_secret_manager_secret_version.read : p.secret_data]
}

variable "secret_read" {
  type = list(object({
    secret  = string
    project = optional(string)
    version = optional(string, "latest")
  }))
  description = "List of secrets to read from Secret Manager"
  default     = []
}

variable "project_id" {}
variable "environment" {
  default = ""
}

variable "secret_labels" {
  type = map(string)
  default = {
    managed-by : "terraform"
  }
}

variable "secret_id" {
  type = string
}

variable "secret_data" {
  type = string
}

variable "policy_roles" {
  type = set(string)
  default = [
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.viewer"
  ]
}

variable "access_members" {
  type    = list(string)
  default = []
}
