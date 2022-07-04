terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.9.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-demo_47829034u"
    storage_account_name = "demo48uq9erhn"
    container_name       = "tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id = var.subscription_id
}

variable "subscription_id" {
  type = string
}

variable "azure_location" {
  type    = string
  default = "westeurope"
}


// Resourcen Gruppe
resource "azurerm_resource_group" "rg-demo_47829034u" {
  name     = "rg-demo_47829034u"
  location = var.azure_location
}


// defines a storage account
resource "azurerm_storage_account" "demo_storage" {
  resource_group_name      = azurerm_resource_group.rg-management.name
  name                     = "demo48uq9erhn"
  location                 = var.azure_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

// define a container in the afore mentioned storage account
resource "azurerm_storage_container" "demo_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.demo_storage
  container_access_type = "private"
}

/** terraform apply --var-file=vars.tfvars
 *
 * Content of the variable file vars.tfvars needs to be the id of the used subscription
 * subscription_id = "123f3q4-1243-1223-4211-1232fdw24"
**/
