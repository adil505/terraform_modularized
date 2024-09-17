resource "azurerm_mssql_database" "sqldb" {
  for_each = var.sqldb_var
  name                = each.value.name
  server_id         = data.azurerm_mssql_server.sqlserver[each.key].id

  # resource_group_name = each.value.rg_name
  # location            = each.value.location

#  collation           = "SQL_Latin1_General_CP1_CI_AS"
  sku_name            = "GP_S_Gen5_1"
  min_capacity = 0.5
  auto_pause_delay_in_minutes = 60
#  max_size_gb         = 32
  zone_redundant      = false
  storage_account_type = "Local"  
}

resource "azurerm_mssql_firewall_rule" "client_ip" {
  for_each = var.sqldb_var
  name = "AllowCurrentClientIP"
  server_id = data.azurerm_mssql_server.sqlserver[each.key].id
  start_ip_address = var.client_ip_start
  end_ip_address = var.client_ip_end
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  for_each = var.sqldb_var
  name = "AllowAzureServices"
  server_id = data.azurerm_mssql_server.sqlserver[each.key].id
  start_ip_address = "0.0.0.0"
  end_ip_address = "0.0.0.0"
}