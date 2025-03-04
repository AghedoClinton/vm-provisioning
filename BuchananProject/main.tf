
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Azure Provider, 
provider "azurerm" {
  features {}
  subscription_id = "{add subscription id}"
}


# Resource group resources module
module "resource_groups" {
  source              = "./modules/resource_groups"
  resource_group_name = var.resource_group_name
  location            = var.location

}

# Network resources module
module "networks" {
  source              = "./modules/networks"
  resource_group_name = module.resource_groups.resource_group_name
  location            = var.location
  security_group_name = var.security_group_name
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
}

# Virtual machine Resources module
module "virtual_machines" {
  source               = "./modules/virtual_machines"
  resource_group_name  = module.resource_groups.resource_group_name
  location             = var.location
  subnet_id            = module.networks.subnet_id
  virtual_machine_name = var.virtual_machine_name
  virtual_machine_size = var.virtual_machine_size
}
