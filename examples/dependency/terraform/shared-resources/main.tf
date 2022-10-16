resource "azurerm_resource_group" "base" {
  name     = format("rg-%s-%s", var.deployment_name, local.location)
  location = var.location

  tags = local.tags
}

resource "azurerm_virtual_network" "base" {
  name                = format("vnet-%s-%s", var.deployment_name, local.location)
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}

resource "azurerm_subnet" "base" {
  name                 = format("snet-%s-%s", var.deployment_name, local.location)
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = ["10.0.0.0/24"]
}
