resource "azurerm_network_interface" "nic" {
  for_each = var.nic_var
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rg_name
  ip_configuration {
    name = each.value.ip_config_name
    private_ip_address_allocation = each.value.private_ip_address_allocation
#    subnet_id = each.value.nic_subnet_id
    subnet_id = data.azurerm_subnet.subnet1[each.key].id
#    public_ip_address_id = data.azurerm_public_ip.pubipdata[each.key].id
  }
}
