resource "azurerm_storage_account" "sa" {
  for_each = var.sa_var
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.rg_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}