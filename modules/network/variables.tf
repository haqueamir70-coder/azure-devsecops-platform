variable "resource_group_name" {
  description = "Name of the resource group where network resources will be deployed."
  type        = string
}

variable "location" {
  description = "Azure region for network resources."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "app_subnet_name" {
  description = "Name of the application subnet."
  type        = string
}

variable "app_subnet_address_prefixes" {
  description = "Address prefixes for the application subnet."
  type        = list(string)
}

variable "management_subnet_name" {
  description = "Name of the management subnet."
  type        = string
}

variable "management_subnet_address_prefixes" {
  description = "Address prefixes for the management subnet."
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to network resources."
  type        = map(string)
  default     = {}
}