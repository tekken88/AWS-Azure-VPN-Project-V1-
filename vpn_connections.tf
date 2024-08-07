############################################################ AZURE to AZURE VPN Connections ############################################################
# HUB VNet to Onsite Vnet
resource "azurerm_virtual_network_gateway_connection" "az-hub-onprem" {
  name                       = "Hub-to-onsite"
  resource_group_name        = var.resource_group_name
  location                   = var.east_hub_vnet_1_location
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.eastus-HUB-vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.localgwonsite.id
  shared_key                 = var.vpn_psk

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

# Onsite VNet to Hub Vnet
resource "azurerm_virtual_network_gateway_connection" "az-onprem-hub" {
  name                       = "Onsite-to-Hub"
  resource_group_name        = var.resource_group_name
  location                   = var.west_onsite_vnet_1_location
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.westus2-ONSITE-vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.localgwhub.id
  shared_key                 = var.vpn_psk

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}


############################################################ AZURE to AWS VPN Connections ############################################################
# HUB VNet to AWS HUB Primary
resource "azurerm_virtual_network_gateway_connection" "azure_hub_to_aws_hub_primary" {
  name                       = "Azure-HUB-to-AWS-HUB-Primary"
  resource_group_name        = var.resource_group_name
  location                   = var.east_hub_vnet_1_location
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.eastus-HUB-vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.awsprimary_azurehub.id
  shared_key                 = aws_vpn_connection.aws_to_azure_connection_1.tunnel1_preshared_key

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}


# Onsite VNet to AWS HUB Secondary
resource "azurerm_virtual_network_gateway_connection" "zure_hub_to_aws_hub_secondary" {
  name                       = "Azure-HUB-to-AWS-HUB-Secondary"
  resource_group_name        = var.resource_group_name
  location                   = var.east_hub_vnet_1_location
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.eastus-HUB-vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.awssecondary_azurehub.id
  shared_key                 = aws_vpn_connection.aws_to_azure_connection_1.tunnel2_preshared_key

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}




############################################################ AWS to AZURE VPN Connections ############################################################
resource "aws_vpn_connection" "aws_to_azure_connection_1" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.azure_hub_vnet.id
  type                = "ipsec.1"
  static_routes_only  = true
  tags = {
    Name = "AWS_to_AZURE_1"
  }
}

resource "aws_vpn_connection_route" "vpn_connection_route_1" {
  destination_cidr_block = "10.0.0.0/8"
  vpn_connection_id      = aws_vpn_connection.aws_to_azure_connection_1.id
}

