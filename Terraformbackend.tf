provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "myResourceGroup"
    storage_account_name  = "mystorageaccount"
    container_name        = "mycontainer"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}
