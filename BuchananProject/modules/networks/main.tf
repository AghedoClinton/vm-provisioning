resource "azurerm_virtual_network" "bt-vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["12.123.0.0/16"]
}

resource "azurerm_network_security_group" "bt-sg" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "bt-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.bt-vnet.name
  address_prefixes     = ["12.123.1.0/24"]
}