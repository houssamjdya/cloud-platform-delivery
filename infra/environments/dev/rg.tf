locals {
  env      = "dev"
  location = "westeurope"

  tags = {
    project    = "cloud-platform-delivery"
    env        = local.env
    owner      = "houssam" # 
    costCenter = "portfolio"
    managedBy  = "terraform"
  }
}

resource "azurerm_resource_group" "platform" {
  name     = "clp-${local.env}-${local.location}-platform"
  location = local.location
  tags     = local.tags
}
