data "azurerm_subnet" "subnet1" {
  for_each = var.bh_var
  name = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.rg_name
}

data "azurerm_public_ip" "pubipdata" {
  for_each = var.bh_var
  name = each.value.pubip_name
  resource_group_name = each.value.rg_name
}
