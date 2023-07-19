<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gkes"></a> [gkes](#module\_gkes) | ./modules/private_gkes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in (required) | `string` | `""` | no |
| <a name="input_yamlconfig_dir"></a> [yamlconfig\_dir](#input\_yamlconfig\_dir) | YAML directory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gkes"></a> [gkes](#output\_gkes) | GKE Details |
<!-- END_TF_DOCS -->