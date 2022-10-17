output "subnet_id" {
  value = azurerm_virtual_network.base.subnet[0].id
}

output "resource_group_name" {
  value = azurerm_resource_group.base.name
}
