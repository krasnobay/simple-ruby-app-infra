module "backend" {
  source             = "../modules/backend"
  config_path        = path.module
  config_name        = "backend.tf"
  namespace          = "krasnobay"
  copy_config_to     = "../${path.module}"
}