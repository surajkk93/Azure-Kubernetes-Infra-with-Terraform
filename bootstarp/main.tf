terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# 1. Create Resource Group (for state storage)
resource "azurerm_resource_group" "rg" {
  name     = "rg-tfstate"
  location = "East US"
}

# 2. Create Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "tfstate${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}

# Random suffix to make Storage Account globally unique
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# 3. Create Storage Container
resource "azurerm_storage_container" "sc" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

# 4. Outputs for later use in backend.tf
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.sc.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
