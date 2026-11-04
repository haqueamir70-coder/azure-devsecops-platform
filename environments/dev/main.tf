provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "network" {
  source = "../../modules/network"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  vnet_name                   = "vnet-azure-devsecops-dev"
  vnet_address_space          = ["10.10.0.0/16"]
  app_subnet_name             = "snet-app"
  app_subnet_address_prefixes = ["10.10.1.0/24"]

  management_subnet_name             = "snet-management"
  management_subnet_address_prefixes = ["10.10.2.0/24"]

  private_endpoint_subnet_name             = "snet-private-endpoints"
  private_endpoint_subnet_address_prefixes = ["10.10.3.0/24"]

  tags = var.tags
}

module "storage" {
  source = "../../modules/storage"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  storage_account_name       = var.storage_account_name
  container_name             = "app-data"
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  virtual_network_id         = module.network.vnet_id

  tags = var.tags

  depends_on = [module.network]
}
