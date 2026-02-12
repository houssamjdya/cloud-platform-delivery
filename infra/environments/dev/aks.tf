resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.prefix}-${local.env}-${local.location}-aks"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  dns_prefix          = "${local.prefix}-${local.env}-${local.location}"

  sku_tier = "Free"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2s_v6"
    vnet_subnet_id = azurerm_subnet.aks.id

    upgrade_settings {
      max_surge = "1"
    }

  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"

    service_cidr   = "10.20.0.0/16"
    dns_service_ip = "10.20.0.10"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.platform.id
  }

  tags = local.tags
}


resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
