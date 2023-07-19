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

output "kms" {
  value = module.kms
}