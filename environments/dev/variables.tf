variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Common tags for Azure resources"
  type        = map(string)

  default = {
    Environment = "dev"
    Project     = "azure-devsecops-platform"
    ManagedBy   = "Terraform"
  }
}