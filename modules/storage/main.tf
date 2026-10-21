resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  min_tls_version                = "TLS1_2"
  https_traffic_only_enabled     = true
  allow_nested_items_to_be_public = false

  # Public endpoint and Shared Key are retained for this self-contained demo.
  # Production deployments should use a private endpoint, Entra ID authorization,
  # diagnostic settings, and customer-managed keys where required by policy.
  public_network_access_enabled = true
  shared_access_key_enabled     = true

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  sas_policy {
    expiration_period = "1.00:00:00"
    expiration_action = "Log"
  }

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}
