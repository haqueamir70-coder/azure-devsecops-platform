variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name."
  type        = string
}

variable "container_name" {
  description = "Name of the private blob container."
  type        = string
  default     = "app-data"
}

variable "private_endpoint_subnet_id" {
  description = "Dedicated subnet ID for the blob private endpoint."
  type        = string
}

variable "virtual_network_id" {
  description = "VNet ID linked to the private DNS zone."
  type        = string
}

variable "tags" {
  description = "Tags to apply to storage resources."
  type        = map(string)
  default     = {}
}
