variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Globally unique, 3-24 character lowercase Azure Storage account name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must contain 3-24 lowercase letters and numbers only."
  }
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
