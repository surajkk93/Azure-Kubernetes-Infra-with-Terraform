variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
variable "nsg_id" {
  description = "ID of the NSG to associate with subnet"
  type        = string
}
