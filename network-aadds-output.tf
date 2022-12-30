############################
## AADDS Network - Output ##
############################

output "network_aadds_resource_group_id" {
  value = azurerm_resource_group.aadds-rg.id
}

output "network_aadds_vnet_id" {
  value = azurerm_virtual_network.aadds-vnet.id
}

output "network_aadds_subnet_id" {
  value = azurerm_subnet.aadds-subnet.id
}
