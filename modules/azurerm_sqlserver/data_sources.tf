data "azurerm_key_vault" "kv" {
  name = "KetVaultb16g18"
  resource_group_name = "B16G18_RG"
}

data "azurerm_key_vault_secret" "username" {
  name = "adil-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name = "adil-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}