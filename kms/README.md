# KMS Terraform Module
This module creates KMS Keys.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
module "kms" {
  source               = "../"
  project_id           = "kms-project"
  location             = "us-central1"
  keyring              = "kms-key-ring"
  keys                 = ["key-bucket"]
  purpose              = "ENCRYPT_DECRYPT"
  key_protection_level = "HSM"
  set_decrypters_for   = ["key-bucket"]
  set_encrypters_for   = ["key-bucket"]
  decrypters           = ["serviceAccount:key-sa@kms-project.iam.gserviceaccount.com"]
  encrypters           = ["serviceAccount:key-sa@kms-project.iam.gserviceaccount.com"]
}
```
## Where should I store my Terraform state?

Terraform state be stored on Google Cloud Storage or Terraform Cloud.

```hcl
terraform {
  backend "gcs" {
    bucket  = "tf-state-projects"
    prefix  = "terraform/state/team1"
  }
}

terraform {
  cloud {
    organization = "tf-org"
    workspaces {
      name = "tf-workspace"
    }
  }
}

```


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key.key_ephemeral](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_binding.decrypters](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_crypto_key_iam_binding.encrypters](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_key_ring.key_ring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_decrypters"></a> [decrypters](#input\_decrypters) | List of comma-separated owners for each key declared in set\_decrypters\_for. | `list(string)` | `[]` | no |
| <a name="input_encrypters"></a> [encrypters](#input\_encrypters) | List of comma-separated owners for each key declared in set\_encrypters\_for. | `list(string)` | `[]` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | Generate a new key every time this period passes. | `string` | `"100000s"` | no |
| <a name="input_keyring"></a> [keyring](#input\_keyring) | Keyring name. | `string` | n/a | yes |
| <a name="input_keys"></a> [keys](#input\_keys) | Key names. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Location for the keyring. | `string` | n/a | yes |
| <a name="input_prevent_destroy"></a> [prevent\_destroy](#input\_prevent\_destroy) | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where the keyring will be created. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The immutable purpose of the CryptoKey. Possible values are ENCRYPT\_DECRYPT, ASYMMETRIC\_SIGN, and ASYMMETRIC\_DECRYPT. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_set_decrypters_for"></a> [set\_decrypters\_for](#input\_set\_decrypters\_for) | Name of keys for which decrypters will be set. | `list(string)` | `[]` | no |
| <a name="input_set_encrypters_for"></a> [set\_encrypters\_for](#input\_set\_encrypters\_for) | Name of keys for which encrypters will be set. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyring"></a> [keyring](#output\_keyring) | Self link of the keyring. |
| <a name="output_keyring_name"></a> [keyring\_name](#output\_keyring\_name) | Name of the keyring. |
| <a name="output_keyring_resource"></a> [keyring\_resource](#output\_keyring\_resource) | Keyring resource. |
| <a name="output_keys"></a> [keys](#output\_keys) | Map of key name => key self link. |
<!-- END_TF_DOCS -->