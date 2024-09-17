module "rg" {
  source = "../../modules/azurerm_rg"
  rg_var = var.mod_rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnet_var   = var.mod_vnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnet_var = var.mod_subnet
}

module "pubip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_pubip"
  pubip_var  = var.mod_pubip
}

module "nic" {
  depends_on = [module.subnet, module.pubip]
  source     = "../../modules/azurerm_nic"
  nic_var    = var.mod_nic
}

module "lin_vm" {
  depends_on = [module.nic]
  source     = "../../modules/azurerm_lin_vm"
  linvm_var  = var.mod_linvm
}

module "win_vm" {
  depends_on = [module.nic]
  source     = "../../modules/azurerm_win_vm"
  winvm_var  = var.mod_winvm
}

module "sa" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_sa"
  sa_var     = var.mod_sa
}

# module "sqlserver" {
#   depends_on    = [module.rg]
#   source        = "../../modules/azurerm_sqlserver"
#   sqlserver_var = var.mod_sqlserver
# }

# module "sqldb" {
#   depends_on      = [module.sqlserver]
#   source          = "../../modules/azurerm_sqldb"
#   sqldb_var       = var.mod_sqldb
#   client_ip_start = var.mod_client_ip_start
#   client_ip_end   = var.mod_client_ip_end
# }

# module "kv" {
#   depends_on = [module.rg]
#   source     = "../../modules/azurerm_keyvault"
#   kv_var     = var.mod_kv
# }

module "bh" {
  depends_on = [module.subnet, module.pubip]
  source     = "../../modules/azurerm_bastion"
  bh_var     = var.mod_bh
}

module "vnetpeer" {
  depends_on    = [module.vnet]
  source        = "../../modules/azurerm_vnet_peering"
  vnet_peer_var = var.mod_vnet_peer
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_nsg"
  nsg_var    = var.mod_nsg
}

module "nic_nsg_assoc" {
  depends_on = [module.nsg, module.nic]
  source     = "../../modules/azurerm_nsg_association"
  nic_var    = var.mod_nicnsg
}

module "subnet_nsg_assoc" {
  depends_on         = [module.subnet, module.nsg]
  source             = "../../modules/azurerm_subnet_nsg_assoc"
  subnetnsgassoc_var = var.mod_subnetnsgassoc
}

module "lb" {
  depends_on = [module.pubip, module.nic]
  source     = "../../modules/azurerm_lb"
  lb_var     = var.mod_lb
  bepool_var = var.mod_bepool
}