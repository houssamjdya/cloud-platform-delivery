resource "azurerm_resource_group" "platform" {
  name     = "${local.prefix}-${local.env}-${local.location}-platform"
  location = local.location
  tags     = local.tags
}


