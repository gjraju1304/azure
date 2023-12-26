# creating virtual network with 3 subnets

resource "azurerm_resource_group" "business" {
  name     = "business"
  location = "central india"
}

resource "azurerm_virtual_network" "network-business" {
  name                = "network-business"
  resource_group_name = azurerm_resource_group.business.name
  address_space       = ["10.100.0.0/16"]
  location            = azurerm_resource_group.business.location
}

resource "azurerm_subnet" "web-sub" {
  name                 = "web-sub"
  resource_group_name  = azurerm_resource_group.business.name
  virtual_network_name = azurerm_virtual_network.network-business.name
  address_prefixes     = ["10.100.0.0/24"]
}

resource "azurerm_subnet" "data-sub" {
  name                 = "data-sub"
  resource_group_name  = azurerm_resource_group.business.name
  virtual_network_name = azurerm_virtual_network.network-business.name
  address_prefixes     = ["10.100.1.0/24"]
}

resource "azurerm_subnet" "dev-sub" {
  name                 = "dev-sub"
  resource_group_name  = azurerm_resource_group.business.name
  virtual_network_name = azurerm_virtual_network.network-business.name
  address_prefixes     = ["10.100.2.0/24"]
}