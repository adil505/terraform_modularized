
resource "azurerm_key_vault" "keyvault" {
  for_each            = var.kv_var
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}
# example of terraform expression
# name = "${each.value.rg_name}-password"


#   access_policy = {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id
#   }


# Copied from https://github.com/devopsinsiders/azure-devsecops-batch-16/blob/main/CodeSamples/ZELECTRIC/modules/azurerm_key_vault/main.tf on 13/09/2024
# data "azurerm_client_config" "dhondhu" {}

# variable "key_vaults" {}

# resource "azurerm_key_vault" "kv" {
#   for_each                    = var.key_vaults
#   name                        = each.value.kv_name
#   location                    = each.value.location
#   resource_group_name         = each.value.rg_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.dhondhu.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.dhondhu.tenant_id
#     object_id = data.azurerm_client_config.dhondhu.object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get", "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
# }