variable "location" {
  description = "Azure region for the lab."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
  default     = "rg-kv-private-lab"
}

variable "name_prefix" {
  description = "Short, globally unique prefix used for Key Vault naming. Use letters, numbers, and hyphens."
  type        = string
  default     = "kv-private-lab"
}

variable "vnet_address_space" {
  description = "Virtual network address space."
  type        = list(string)
  default     = ["10.40.0.0/16"]
}

variable "private_endpoint_subnet_prefix" {
  description = "Subnet prefix reserved for private endpoints."
  type        = list(string)
  default     = ["10.40.1.0/24"]
}

variable "workload_principal_object_id" {
  description = "Optional Microsoft Entra service principal or managed identity object ID to grant Key Vault Secrets User. Leave empty to manage RBAC separately."
  type        = string
  default     = ""
}
