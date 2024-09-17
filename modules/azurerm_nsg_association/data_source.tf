data "azurerm_network_interface" "nic" {
  for_each = var.nic_var
  name = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_security_group" "nsg" {
  for_each = var.nic_var
  name = each.value.nsg_name
  resource_group_name = each.value.rg_name
}