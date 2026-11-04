output "storage_account_id" {
  description = "ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "container_name" {
  description = "Name of the private blob container."
  value       = azurerm_storage_container.this.name
}
output "private_endpoint_id" {
  description = "ID of the private endpoint for the blob service."
  value       = azurerm_private_endpoint.blob.id
}

output "private_dns_zone_id" {
  description = "ID of the private DNS zone linked to the VNet."
  value       = azurerm_private_dns_zone.blob.id
}
