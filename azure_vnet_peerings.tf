#### EAST HUB VNET Peerings ####
#### Create Peering East HUB to Central Spoke 
resource "azurerm_virtual_network_peering" "east-hub1-central-workload1" {
  name                         = "easthub1-centralworkload1"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.frontend_vnet_east_1.name
  remote_virtual_network_id    = azurerm_virtual_network.backend_vnet_workload_centralus_1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}

##########################################################################################################
#### SPOKE VNET Peerings ####
#### Create Peering Central Spoke to East HUB ####
resource "azurerm_virtual_network_peering" "spokecn-hubest-peer" {
  name                         = "centralworload1-easthub1"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.backend_vnet_workload_centralus_1.name
  remote_virtual_network_id    = azurerm_virtual_network.frontend_vnet_east_1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true

  depends_on = [
    azurerm_virtual_network.frontend_vnet_east_1,
    azurerm_virtual_network.backend_vnet_workload_centralus_1,
    azurerm_virtual_network_gateway.eastus-HUB-vpn-gateway,
    azurerm_subnet.gateway_subnet_east,
  azurerm_subnet.gateway_subnet_west_onsite_1]

  timeouts {
    create = "2h"
    read   = "2h"
    update = "2h"
    delete = "2h"
  }
}
