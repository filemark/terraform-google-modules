# asecret

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_policy.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_policy) | resource |
| [google_secret_manager_secret_version.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_iam_policy.secret_accessor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |
| [google_secret_manager_secret_version.read](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_members"></a> [access\_members](#input\_access\_members) | n/a | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_policy_roles"></a> [policy\_roles](#input\_policy\_roles) | n/a | `set(string)` | <pre>[<br>  "roles/secretmanager.secretAccessor",<br>  "roles/secretmanager.viewer"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `any` | n/a | yes |
| <a name="input_secret_data"></a> [secret\_data](#input\_secret\_data) | n/a | `string` | n/a | yes |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | n/a | `string` | n/a | yes |
| <a name="input_secret_labels"></a> [secret\_labels](#input\_secret\_labels) | n/a | `map(string)` | <pre>{<br>  "managed-by": "terraform"<br>}</pre> | no |
| <a name="input_secret_read"></a> [secret\_read](#input\_secret\_read) | List of secrets to read from Secret Manager | <pre>list(object({<br>    secret  = string<br>    project = optional(string)<br>    version = optional(string, "latest")<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_secret_id"></a> [full\_secret\_id](#output\_full\_secret\_id) | n/a |
| <a name="output_policy_access_members"></a> [policy\_access\_members](#output\_policy\_access\_members) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
| <a name="output_read_map"></a> [read\_map](#output\_read\_map) | A map of the names and values read |
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
