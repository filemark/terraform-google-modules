variable "project_id" {}

variable "projects" {
  type    = set(string)
  default = []
}

variable "permissions" {
  type = list(string)
}

variable "role_name" {
  type = string
}

variable "role_title" {
  type = string
}

variable "role_description" {
  default = ""
}
