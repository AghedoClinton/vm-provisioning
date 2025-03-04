resource "azurerm_resource_group" "bt-rg" {
  name     = var.resource_group_name
  location = var.location
}