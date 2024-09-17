data "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqldb_var
  name = each.value.server_name
  resource_group_name = each.value.rg_name
}