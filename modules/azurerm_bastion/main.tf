resource "azurerm_bastion_host" "bh" {
  for_each = var.bh_var  
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rg_name
  sku = "Basic"
  ip_configuration {
    name = "BastionIpConfig"
    subnet_id = data.azurerm_subnet.subnet1[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pubipdata[each.key].id
  }
}