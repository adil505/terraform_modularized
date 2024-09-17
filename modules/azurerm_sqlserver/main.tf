resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqlserver_var
  name                         = each.value.name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.username.value
  administrator_login_password = data.azurerm_key_vault_secret.password.value
  public_network_access_enabled = true
  
}