data "azurerm_virtual_network" "peer" {
  for_each = var.vnet_peer_var
  name = each.value.remote_virtual_network_name
  resource_group_name = each.value.remote_vnet_rg_name
}