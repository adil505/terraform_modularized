data "azurerm_network_interface" "nic" {
  for_each = var.bepool_var
  name = each.value.nic_name
  resource_group_name = each.value.nic_rg
}