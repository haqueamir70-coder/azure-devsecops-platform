output "resource_group_name" {
  description = "Resource group containing the lab."
  value       = azurerm_resource_group.this.name
}

output "key_vault_name" {
  description = "Key Vault name."
  value       = azurerm_key_vault.this.name
}

output "key_vault_uri" {
  description = "Key Vault endpoint URI; data-plane access still requires private network connectivity and RBAC."
  value       = azurerm_key_vault.this.vault_uri
}

output "private_endpoint_id" {
  description = "Private Endpoint resource ID."
  value       = azurerm_private_endpoint.key_vault.id
}

output "private_dns_zone_name" {
  description = "Private DNS zone used for Key Vault private endpoint resolution."
  value       = azurerm_private_dns_zone.key_vault.name
}
