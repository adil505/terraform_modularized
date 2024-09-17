data "azurerm_subnet" "subnet1" {
  for_each = var.nic_var
  name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.rg_name
}



