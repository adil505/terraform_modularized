resource "random_password" "pw" {
  for_each = var.winvm_var
  length = 12
  special = true
}

resource "azurerm_key_vault_secret" "kv_secret" {
  for_each = var.winvm_var
  name = "${each.value.vm_name}-password"
  value = random_password.pw[each.key].result
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_windows_virtual_machine" "windowsvm" {
  for_each = var.winvm_var
  name = each.value.vm_name
  resource_group_name = each.value.vm_resource_group_name
  location = each.value.vm_location
  network_interface_ids = [data.azurerm_network_interface.nic_win[each.key].id]
  size = each.value.vm_size
  os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
  }
  admin_username = "testadmin"
  admin_password = azurerm_key_vault_secret.kv_secret[each.key].value
  source_image_reference {
    publisher = each.value.vm_publisher
    offer     = each.value.vm_offer
    sku       = each.value.vm_sku
    version   = each.value.vm_version
    }
}



# resource "azurerm_virtual_machine" "vm" {
#     for_each = var.win_vm_var
#     name = each.key
#     location = each.value.vm_location
#     resource_group_name = each.value.vm_resource_group_name
# #    network_interface_ids = each.value.vm_network_interface_id
#     network_interface_ids = [data.azurerm_network_interface.nic_win.id]
#     vm_size = each.value.vm_size

#     delete_os_disk_on_termination = true
#     delete_data_disks_on_termination = true

#     storage_image_reference {
#       publisher = each.value.vm_publisher
#       offer     = each.value.vm_offer
#       sku       = each.value.vm_sku
#       version   = each.value.vm_version
#     }

#     storage_os_disk {
#       name              = each.value.vm_os_disk_name
#       caching           = "ReadWrite"
#       create_option     = "FromImage"
#       managed_disk_type = each.value.vm_managed_disk_type
#     }  

#     os_profile {
#       computer_name = each.value.vm_computer_name
#       admin_username = data.azurerm_key_vault_secret.username.value
#       admin_password = data.azurerm_key_vault_secret.password.value
#     }

#     os_profile_windows_config {
# #      disable_password_authentication = false
#     }

# }