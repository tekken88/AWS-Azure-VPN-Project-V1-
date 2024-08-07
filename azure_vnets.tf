#### Creates a HUB "1" VNET in East US ####
resource "azurerm_virtual_network" "frontend_vnet_east_1" {
  name                = var.east_hub_vnet_1_name
  location            = var.east_hub_vnet_1_location
  resource_group_name = var.resource_group_name
  address_space       = [var.east_hub_vnet_1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create Public-Subnet-1
resource "azurerm_subnet" "public_subnet_east_1" {
  name                 = var.east_hub_vnet_pub1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.frontend_vnet_east_1.name
  address_prefixes     = [var.east_hub_vnet_pub1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create Private-subnet-1
resource "azurerm_subnet" "private_subnet_east_1" {
  name                 = var.east_hub_vnet_private1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.frontend_vnet_east_1.name
  address_prefixes     = [var.east_hub_vnet_private1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create GatewaySubnet
resource "azurerm_subnet" "gateway_subnet_east" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.frontend_vnet_east_1.name
  address_prefixes     = [var.east_hub_vnet_gateway_subnet_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

##########################################################################################################

#### Creates Backend Spoke VNET "Workload 1" in CentralUS ####
resource "azurerm_virtual_network" "backend_vnet_workload_centralus_1" {
  name                = var.centralus_workload_spoke_vnet_1_name
  location            = var.centralus_workload_spoke_vnet_1_location
  resource_group_name = var.resource_group_name
  address_space       = [var.centralus_workload_spoke_vnet_1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create Private-Subnet-1
resource "azurerm_subnet" "private_subnet_workload_centralus_1" {
  name                 = var.centralus_workload_private1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.backend_vnet_workload_centralus_1.name
  address_prefixes     = [var.centralus_workload_private1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

##########################################################################################################

#### Creates an "ONSITE SIMULATION" in WEST US 2 ####
resource "azurerm_virtual_network" "vnet_west_onsite_1" {
  name                = var.west_onsite_vnet_1_name
  location            = var.west_onsite_vnet_1_location
  resource_group_name = var.resource_group_name
  address_space       = [var.west_onsite_vnet_1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Public-Subnet-1
resource "azurerm_subnet" "public_subnet_west_onsite_1" {
  name                 = var.west_onsite_vnet_pub1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_west_onsite_1.name
  address_prefixes     = [var.west_onsite_vnet_pub1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the Private-subnet-1
resource "azurerm_subnet" "private_subnet_west_onsite_1" {
  name                 = var.west_onsite_vnet_private1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_west_onsite_1.name
  address_prefixes     = [var.west_onsite_vnet_private1_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Create the GatewaySubnet
resource "azurerm_subnet" "gateway_subnet_west_onsite_1" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_west_onsite_1.name
  address_prefixes     = [var.west_onsite_vnet_gateway_subnet_address]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}
