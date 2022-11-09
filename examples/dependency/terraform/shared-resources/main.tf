resource "azurerm_resource_group" "base" {
  name     = format("rg-%s-%s", var.deployment_name, local.location)
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "base" {
  name                = format("vnet-%s-%s", var.deployment_name, local.location)
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = format("snet-%s-%s", var.deployment_name, local.location)
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.default.id
  }

  tags = local.tags
}

resource "azurerm_network_security_group" "default" {
  name                = format("nsg-%s-%s", var.deployment_name, local.location)
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  tags                = local.tags
}
