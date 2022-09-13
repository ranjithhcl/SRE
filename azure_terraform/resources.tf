resource "azurerm_resource_group" "rg" {
  name     = "TfStateStorageAccount"
  location = "westus2"
  tags = {
    Environment = "testing"
    Name        = "Terraform StateFile"
    Project     = "test"
  }
}


resource "azurerm_storage_account" "tfstate" {
  name                     = "mytestzaq12wsx"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

