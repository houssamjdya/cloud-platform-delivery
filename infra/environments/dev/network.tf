resource "azurerm_virtual_network" "platform" {
  name                = "${local.prefix}-${local.env}-${local.location}-vnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.platform.name
  address_space       = ["10.10.0.0/16"]

  tags = local.tags
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.platform.name
  virtual_network_name = azurerm_virtual_network.platform.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.platform.name
  virtual_network_name = azurerm_virtual_network.platform.name
  address_prefixes     = ["10.10.2.0/24"]

  private_endpoint_network_policies = "Disabled"
}
