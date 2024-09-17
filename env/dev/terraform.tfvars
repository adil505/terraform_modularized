mod_rg = {
  rg1 = {
    name     = "adil_rg1"
    location = "uksouth"
  }
  rg2 = {
    name     = "adil_rg2"
    location = "ukwest"
  }
}

mod_vnet = {
  vnet1 = {
    name         = "adil_vnet1"
    rg_name      = "adil_rg1"
    location     = "uksouth"
    address_pool = ["10.0.0.0/20"]
  }
  vnet2 = {
    name         = "adil_vnet2"
    rg_name      = "adil_rg2"
    location     = "ukwest"
    address_pool = ["10.0.16.0/20"]
  }

}

mod_subnet = {
  subnet1 = {
    subnet_name   = "adil_vnet1_subnet1"
    subnet_prefix = ["10.0.0.0/24"]
    rg_name       = "adil_rg1"
    vnet_name     = "adil_vnet1"
  }
  subnet2 = {
    subnet_name   = "adil_vnet1_subnet2"
    subnet_prefix = ["10.0.1.0/24"]
    rg_name       = "adil_rg1"
    vnet_name     = "adil_vnet1"
  }
  subnet3 = {
    subnet_name   = "AzureBastionSubnet"
    subnet_prefix = ["10.0.2.0/24"]
    rg_name       = "adil_rg1"
    vnet_name     = "adil_vnet1"
  }
  subnet4 = {
    subnet_name   = "adil_vnet2_subnet1"
    subnet_prefix = ["10.0.16.0/24"]
    rg_name       = "adil_rg2"
    vnet_name     = "adil_vnet2"
  }
  subnet5 = {
    subnet_name   = "adil_vnet2_subnet2"
    subnet_prefix = ["10.0.17.0/24"]
    rg_name       = "adil_rg2"
    vnet_name     = "adil_vnet2"
  }
}

mod_vnet_peer = {
  peer1 = {
    name                        = "vent1_to_vnet2"
    rg_name                     = "adil_rg1"
    virtual_network_name        = "adil_vnet1"
    remote_virtual_network_name = "adil_vnet2"
    remote_vnet_rg_name         = "adil_rg2"
  }
  peer2 = {
    name                        = "vent2_to_vnet1"
    rg_name                     = "adil_rg2"
    virtual_network_name        = "adil_vnet2"
    remote_virtual_network_name = "adil_vnet1"
    remote_vnet_rg_name         = "adil_rg1"
  }
}

mod_pubip = {
  pubip1 = {
    name     = "adil_pubip1"
    rg_name  = "adil_rg1"
    location = "uksouth"
  }
  pubip2 = {
    name     = "adil_pubip2"
    rg_name  = "adil_rg1"
    location = "uksouth"
  }
}

mod_nic = {
  nic1 = {
    name                          = "adil_nic1"
    location                      = "uksouth"
    rg_name                       = "adil_rg1"
    ip_config_name                = "testconfiguration1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "adil_vnet1"
    subnet_name                   = "adil_vnet1_subnet1"
  }
  nic2 = {
    name                          = "adil_nic2"
    location                      = "uksouth"
    rg_name                       = "adil_rg1"
    ip_config_name                = "testconfiguration1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "adil_vnet1"
    subnet_name                   = "adil_vnet1_subnet2"
  }
  nic3 = {
    name                          = "adil_nic3"
    location                      = "ukwest"
    rg_name                       = "adil_rg2"
    ip_config_name                = "testconfiguration1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "adil_vnet2"
    subnet_name                   = "adil_vnet2_subnet1"
  }
  nic4 = {
    name                          = "adil_nic4"
    location                      = "ukwest"
    rg_name                       = "adil_rg2"
    ip_config_name                = "testconfiguration1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "adil_vnet2"
    subnet_name                   = "adil_vnet2_subnet2"
  }
}


mod_sa = {
  sa1 = {
    name                     = "londusa1"
    location                 = "uksouth"
    rg_name                  = "adil_rg1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

mod_sqlserver = {
  sqlserver1 = {
    name     = "adil-sqlserver"
    rg_name  = "adil_rg1"
    location = "uksouth"
    version  = "12.0"
  }
}

mod_sqldb = {
  sqldb1 = {
    name        = "adil-db"
    rg_name     = "adil_rg1"
    location    = "uksouth"
    server_name = "adil-sqlserver"
  }
}

mod_kv = {
  kv1 = {
    name           = "adilkeyvault"
    location       = "uksouth"
    resource_group = "adil_rg1"
  }
}

mod_bh = {
  bh1 = {
    name                 = "adil-bastion"
    location             = "uksouth"
    rg_name              = "adil_rg1"
    virtual_network_name = "adil_vnet1"
    pubip_name           = "adil_pubip1"
  }
}


mod_nsg = {
  nsg1 = {
    name     = "nsg1"
    location = "uksouth"
    rg_name  = "adil_rg1"
  }
  nsg2 = {
    name     = "nsg2"
    location = "ukwest"
    rg_name  = "adil_rg2"
  }
}


mod_subnetnsgassoc = {
  assoc1 = {
    subnet_rg_name = "adil_rg1"
    vnet_name      = "adil_vnet1"
    subnet_name    = "adil_vnet1_subnet1"
    nsg_name       = "nsg1"
    nsg_rg_name    = "adil_rg1"
  }
  assoc2 = {
    subnet_rg_name = "adil_rg1"
    vnet_name      = "adil_vnet1"
    subnet_name    = "adil_vnet1_subnet2"
    nsg_name       = "nsg1"
    nsg_rg_name    = "adil_rg1"
  }
  assoc3 = {
    subnet_rg_name = "adil_rg2"
    vnet_name      = "adil_vnet2"
    subnet_name    = "adil_vnet2_subnet1"
    nsg_name       = "nsg2"
    nsg_rg_name    = "adil_rg2"
  }
  assoc4 = {
    subnet_rg_name = "adil_rg2"
    vnet_name      = "adil_vnet2"
    subnet_name    = "adil_vnet2_subnet2"
    nsg_name       = "nsg2"
    nsg_rg_name    = "adil_rg2"
  }
}

mod_lb = {
  lb_name             = "adil_lb"
  lb_location         = "uksouth"
  lb_rgname           = "adil_rg1"
  frontendipconf_name = "adil_lb_fe_ip_config"
  bepool_name         = "adil_lb_bepool"
  lbprobe_name        = "adil_lb_probe"
  lb_rule_name        = "adil_lb_rule"

}

mod_bepool = {
  target1 = {
    nic_name      = "adil_nic1"
    nic_rg        = "adil_rg1"
    ipconfig_name = "testconfiguration1"
  }
  target2 = {
    nic_name      = "adil_nic2"
    nic_rg        = "adil_rg1"
    ipconfig_name = "testconfiguration1"
  }
}

# mod_lbnic = {
#   nic1 = {
#     nic_name  = "adil_nic1"
#     rg_name   = "adil_rg1"
#     pool_name = "be_pool1"
#     ipconfig_name = "ipconfig1"
#   }
#   nic2 = {
#     nic_name  = "adil_nic2"
#     rg_name   = "adil_rg1"
#     pool_name = "be_pool1"
#     ipconfig_name = "ipconfig2"
#   }
#   nic1 = {
#     nic_name  = "adil_nic3"
#     rg_name   = "adil_rg1"
#     pool_name = "be_pool2"
#     ipconfig_name = "ipconfig3"
#   }
#   nic1 = {
#     nic_name  = "adil_nic4"
#     rg_name   = "adil_rg1"
#     pool_name = "be_pool2"
#     ipconfig_name = "ipconfig4"
#   }
# }

mod_linvm = {
  vm1 = {
    vm_name                 = "linux-vm1"
    vm_resource_group_name  = "adil_rg1"
    vm_location             = "uksouth"
    vm_size                 = "Standard_DS1_v2"
    vm_network_interface_id = ["/subscriptions/c5e5baa3-62eb-4e80-bf4b-b3451d27311e/resourceGroups/adil_rg1_uksouth/providers/Microsoft.Network/networkInterfaces/adil_nic_linux_vm1"]
    vm_os_disk_name         = "adil-osdisk1"
    vm_managed_disk_type    = "Standard_LRS"
    vm_publisher            = "Canonical"
    vm_offer                = "0001-com-ubuntu-server-jammy"
    vm_sku                  = "22_04-lts-gen2"
    vm_version              = "latest"
    vm_computer_name        = "linux-vm1"
    vm_admin_username       = "testadmin"
    vm_nic_name             = "adil_nic1"
  }
  vm2 = {
    vm_name                 = "linux-vm2"
    vm_resource_group_name  = "adil_rg1"
    vm_location             = "uksouth"
    vm_size                 = "Standard_DS1_v2"
    vm_network_interface_id = ["/subscriptions/c5e5baa3-62eb-4e80-bf4b-b3451d27311e/resourceGroups/adil_rg1_uksouth/providers/Microsoft.Network/networkInterfaces/adil_nic_linux_vm1"]
    vm_os_disk_name         = "adil-osdisk2"
    vm_managed_disk_type    = "Standard_LRS"
    vm_publisher            = "Canonical"
    vm_offer                = "0001-com-ubuntu-server-jammy"
    vm_sku                  = "22_04-lts-gen2"
    vm_version              = "latest"
    vm_computer_name        = "linux-vm2"
    vm_admin_username       = "testadmin"
    vm_nic_name             = "adil_nic2"
  }
  vm3 = {
    vm_name                 = "linux-vm3"
    vm_resource_group_name  = "adil_rg2"
    vm_location             = "ukwest"
    vm_size                 = "Standard_DS1_v2"
    vm_network_interface_id = ["/subscriptions/c5e5baa3-62eb-4e80-bf4b-b3451d27311e/resourceGroups/adil_rg1_uksouth/providers/Microsoft.Network/networkInterfaces/adil_nic_linux_vm1"]
    vm_os_disk_name         = "adil-osdisk3"
    vm_managed_disk_type    = "Standard_LRS"
    vm_publisher            = "Canonical"
    vm_offer                = "0001-com-ubuntu-server-jammy"
    vm_sku                  = "22_04-lts-gen2"
    vm_version              = "latest"
    vm_computer_name        = "linux-vm3"
    vm_admin_username       = "testadmin"
    vm_nic_name             = "adil_nic4"
  }
}

mod_winvm = {
  winvm1 = {
    vm_name                 = "win-vm1"
    vm_resource_group_name  = "adil_rg2"
    vm_location             = "ukwest"
    vm_size                 = "Standard_DS1_v2"
    vm_network_interface_id = ["/subscriptions/c5e5baa3-62eb-4e80-bf4b-b3451d27311e/resourceGroups/adil_rg2_ukwest/providers/Microsoft.Network/networkInterfaces/adil_nic_win_vm1"]
    vm_managed_disk_type    = "Standard_LRS"
    vm_publisher            = "MicrosoftWindowsServer"
    vm_offer                = "WindowsServer"
    vm_sku                  = "2022-datacenter-azure-edition"
    vm_version              = "latest"
    vm_computer_name        = "hostname"
    vm_admin_username       = "testadmin"
    vm_os_disk_name         = "adil-osdisk4"
    vm_nic_name             = "adil_nic3"
  }
}

mod_nicnsg = {
  assoc1 = {
    nic_name = "adil_nic1"
    nsg_name = "nsg1"
    rg_name = "adil_rg1"
  }
  assoc2 = {
    nic_name = "adil_nic2"
    nsg_name = "nsg1"
    rg_name = "adil_rg1"
  }
  assoc3 = {
    nic_name = "adil_nic3"
    nsg_name = "nsg2"
    rg_name = "adil_rg2"
  }
  assoc4 = {
    nic_name = "adil_nic4"
    nsg_name = "nsg2"
    rg_name = "adil_rg2"
  }
}