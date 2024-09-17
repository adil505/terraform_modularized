resource "azurerm_virtual_network_peering" "vnet_peer" {
  for_each = var.vnet_peer_var
  name = each.value.name
  resource_group_name = each.value.rg_name
  virtual_network_name = each.value.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.peer[each.key].id
  allow_forwarded_traffic = true
}