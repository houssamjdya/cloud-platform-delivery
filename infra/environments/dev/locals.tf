locals {
  env      = "dev"
  location = "westeurope"
  prefix   = "clp"

  tags = {
    project    = "cloud-platform-delivery"
    env        = local.env
    owner      = "houssam"
    costCenter = "portfolio"
    managedBy  = "terraform"
  }
}
