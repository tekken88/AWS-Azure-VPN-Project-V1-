############################################################ AZURE to AZURE LNGs ############################################################
# Local Network Gateway HUB 
resource "azurerm_local_network_gateway" "localgwhub" {
  name                = "HUB"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_east.location
  gateway_address     = azurerm_public_ip.eastus-vpn-gateway-pip.ip_address
  address_space       = ["10.0.0.0/16", "10.2.0.0/16", "192.168.0.0/16"]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Local Network Gateway ONSITE 
resource "azurerm_local_network_gateway" "localgwonsite" {
  name                = "ONSITE"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_west.location
  gateway_address     = azurerm_public_ip.westus2-vpn-gateway-pip.ip_address
  address_space       = azurerm_virtual_network.terraform_vnet_west.address_space

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

############################################################ AWS CGWs for AZURE Gateways ############################################################
## CGW for Azure HUB Gateway
resource "aws_customer_gateway" "azure_hub_vnet" {
  bgp_asn    = 65000
  ip_address = azurerm_public_ip.eastus-vpn-gateway-pip.ip_address
  type       = "ipsec.1"

  tags = {
    Name = "Azure Hub"
  }
}

############################################################ AZURE LNGs for AWS HUB Gateway ############################################################
resource "azurerm_local_network_gateway" "awsprimary_azurehub" {
  name                = "AWS_HUB_Primary"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_east.location
  gateway_address     = aws_vpn_connection.aws_to_azure_connection_1.tunnel1_address
  address_space       = [aws_vpc.vpc.cidr_block]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Local Network Gateway ONSITE 
resource "azurerm_local_network_gateway" "awssecondary_azurehub" {
  name                = "AWS_HUB_Secondary"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_east.location
  gateway_address     = aws_vpn_connection.aws_to_azure_connection_1.tunnel2_address
  address_space       = [aws_vpc.vpc.cidr_block]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}