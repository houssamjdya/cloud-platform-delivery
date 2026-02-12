resource "azurerm_container_registry" "acr" {
  name                = "${replace(local.prefix, "-", "")}${local.env}${local.location}acr"
  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location

  sku           = "Basic"
  admin_enabled = false

  tags = local.tags
}
