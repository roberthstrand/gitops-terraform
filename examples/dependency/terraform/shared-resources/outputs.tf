output "subnet_id" {
  value = azurerm_virtual_network.base.subnets[0].id
}

output "resource_group_name" {
  value = azurerm_resource_group.base.name
}
