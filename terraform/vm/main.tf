resource "azurerm_resource_group" "vm" {
  name     = format("rg-%s", var.name)
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s", var.name)
  resource_group_name = azurerm_resource_group.vm.name
  location            = azurerm_resource_group.vm.location

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = format("sub-%s", var.name)
  resource_group_name  = azurerm_resource_group.vm.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "vm" {
  source  = "crayon/vm/azurerm"
  version = "1.11.0"

  name           = format("vm%s", var.name)
  resource_group = azurerm_resource_group.vm.name
  location       = azurerm_resource_group.vm.location

  network_interface_subnets = [{
    name                 = azurerm_subnet.subnet.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name  = azurerm_resource_group.vm.name
    public_ip_id         = null
    static_ip            = null
  }]

  admin_user = {
    username = "crayonadm"
    password = var.vm_password
  }

  depends_on = [
    azurerm_resource_group.vm
  ]
}
