output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "app_subnet_id" {
  description = "ID of the application subnet."
  value       = azurerm_subnet.app.id
}

output "management_subnet_id" {
  description = "ID of the management subnet."
  value       = azurerm_subnet.management.id
}

output "app_network_security_group_id" {
  description = "ID of the application subnet's network security group."
  value       = azurerm_network_security_group.app.id
}

output "management_network_security_group_id" {
  description = "ID of the management subnet's network security group."
  value       = azurerm_network_security_group.management.id
}
