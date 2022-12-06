# service_account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cross_project_role"></a> [cross\_project\_role](#module\_cross\_project\_role) | ../iam/cross-project-custom-role | n/a |
| <a name="module_secret"></a> [secret](#module\_secret) | ../ssm-secret | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.role_set_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_policy.json-key-creators](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_policy) | resource |
| [google_service_account_key.json_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_iam_policy.json-key-creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `any` | n/a | yes |
| <a name="input_add_email_as_secret"></a> [add\_email\_as\_secret](#input\_add\_email\_as\_secret) | used in business apps for GKE Workload Identity | `bool` | `false` | no |
| <a name="input_create_custom_role"></a> [create\_custom\_role](#input\_create\_custom\_role) | n/a | `bool` | `false` | no |
| <a name="input_create_key"></a> [create\_key](#input\_create\_key) | n/a | `bool` | `false` | no |
| <a name="input_cross_project_permission_project_ids"></a> [cross\_project\_permission\_project\_ids](#input\_cross\_project\_permission\_project\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_custom_role_name"></a> [custom\_role\_name](#input\_custom\_role\_name) | n/a | `string` | `""` | no |
| <a name="input_custom_role_title"></a> [custom\_role\_title](#input\_custom\_role\_title) | n/a | `string` | `""` | no |
| <a name="input_decode_key_before_storing"></a> [decode\_key\_before\_storing](#input\_decode\_key\_before\_storing) | n/a | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"Managed by terraform"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_output_key"></a> [output\_key](#input\_output\_key) | dont | `bool` | `false` | no |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | List of permissions that aren't contained in any of the available roles. If not provided - only roles list will be applied to the service account | `list(string)` | `[]` | no |
| <a name="input_policy_members"></a> [policy\_members](#input\_policy\_members) | n/a | `list(string)` | `[]` | no |
| <a name="input_policy_roles"></a> [policy\_roles](#input\_policy\_roles) | Roles to assign to users regarding this service account. Complements local.all\_users. | `list(string)` | <pre>[<br>  "roles/iam.serviceAccountTokenCreator",<br>  "roles/iam.serviceAccountKeyAdmin",<br>  "roles/iam.serviceAccountUser"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | `set(string)` | `[]` | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | n/a |
| <a name="output_assigned_roles"></a> [assigned\_roles](#output\_assigned\_roles) | n/a |
| <a name="output_custom_role"></a> [custom\_role](#output\_custom\_role) | n/a |
| <a name="output_custom_role_created"></a> [custom\_role\_created](#output\_custom\_role\_created) | n/a |
| <a name="output_email"></a> [email](#output\_email) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_projects_affected"></a> [projects\_affected](#output\_projects\_affected) | n/a |
| <a name="output_secret_ids"></a> [secret\_ids](#output\_secret\_ids) | n/a |
| <a name="output_service_account_json_key"></a> [service\_account\_json\_key](#output\_service\_account\_json\_key) | n/a |
| <a name="output_users_allowed_access"></a> [users\_allowed\_access](#output\_users\_allowed\_access) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
