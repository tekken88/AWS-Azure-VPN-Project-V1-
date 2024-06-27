# refer to a resource group
data "azurerm_resource_group" "test" {
  name = var.resource_group_name
}

##########################################################################################################
#### Create the Vnet East US HUB ####
resource "azurerm_virtual_network" "terraform_vnet_east" {
  name                = "vnet_eastus_HUB"
  location            = "East US"
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Public-Subnet-1
resource "azurerm_subnet" "public_subnet_east_1" {
  name                      = "public-subnet-east-1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_east.name
  address_prefixes          = ["10.0.1.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Private-subnet-1
resource "azurerm_subnet" "private_subnet_east_1" {
  name                      = "private-subnet-east-1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_east.name
  address_prefixes          = ["10.0.2.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the GatewaySubnet
resource "azurerm_subnet" "gateway_subnet_east" {
  name                      = "GatewaySubnet"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_east.name
  address_prefixes          = ["10.0.3.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

##########################################################################################################
#### Create the Vnet West2 ONSITE ####
resource "azurerm_virtual_network" "terraform_vnet_west" {
  name                = "vnet_west_us2_ONSITE"
  location            = "West US 2"
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Public-Subnet-1
resource "azurerm_subnet" "public_subnet_west_1" {
  name                      = "public-subnet-west-1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_west.name
  address_prefixes          = ["10.1.1.0/24"] 

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Private-subnet-1
resource "azurerm_subnet" "private_subnet_west_1" {
  name                      = "private-subnet-west-1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_west.name
  address_prefixes          = ["10.1.2.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the GatewaySubnet
resource "azurerm_subnet" "gateway_subnet_west" {
  name                      = "GatewaySubnet"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_west.name
  address_prefixes          = ["10.1.3.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

##########################################################################################################
#### Create the Vnet CentralUS SPOKE ####
resource "azurerm_virtual_network" "terraform_vnet_central" {
  name                = "vnet_central_us_SPOKE"
  location            = "Central US"
  resource_group_name = var.resource_group_name
  address_space       = ["10.2.0.0/16"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Public-Subnet-1
resource "azurerm_subnet" "public_subnet_central_1" {
  name                      = "public-subnet-central-1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.terraform_vnet_central.name
  address_prefixes          = ["10.2.1.0/24"]

  timeouts {
    create = "2h"
    read = "2h"
    update = "2h"
    delete = "2h"
  }
}
