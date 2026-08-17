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

  tags = var.tags
}
module "storage" {
  source = "../../modules/storage"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  storage_account_name = "stdevsecopsplatform01"
  container_name       = "app-data"

  tags = var.tags
}