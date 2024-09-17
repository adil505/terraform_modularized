resource "azurerm_public_ip" "public_ip" {
  for_each = var.pubip_var
  name = each.value.name
  resource_group_name = each.value.rg_name
  location = each.value.location
  allocation_method = "Static"
  sku = "Standard"
}

