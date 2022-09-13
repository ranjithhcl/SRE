# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
## BACKEND
terraform {
    backend "azurerm" {
        resource_group_name  = "TfStateStorageAccount"
        storage_account_name = "mytestzaq12wsxtest"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}
