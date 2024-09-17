variable "mod_rg" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to resource group child module variable"
}

variable "mod_vnet" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to virtual network child module variable"
}

variable "mod_subnet" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to subnet child module variable"
}

variable "mod_pubip" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to publicip child module variable"
}

variable "mod_nic" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to nic child module variable"
}

variable "mod_sa" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to storage account child module variable"
}

variable "mod_sqlserver" {
  type = map(any)
}

variable "mod_sqldb" {
  type = map(any)
}

# variable "mod_client_ip_start" {
#   description = "this variable holds parameters values needed to be passed on for the client to get access to mssql server. Enter start of the range of the client's public ip address(es)"
#   type        = string
# }

# variable "mod_client_ip_end" {
#   description = "this variable holds parameters values needed to be passed on for the client to get access to mssql server. Enter end of the range of the client's public ip address(es)"
#   type        = string
# }


variable "mod_kv" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to keyvault child module variable"
}

variable "mod_bh" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to bastion host child module variable"
}

variable "mod_vnet_peer" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to vnet peering child module variable"
}


variable "mod_nsg" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to nsg child module variable"
}

variable "mod_subnetnsgassoc" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to subnet-nsg association child module variable"
}

variable "mod_lb" {

}

variable "mod_bepool" {

}

variable "mod_linvm" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to linux_vm child module variable"
}

variable "mod_winvm" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to windows_vm child module variable"
}

variable "mod_nicnsg" {
  type        = map(any)
  description = "this is a main module's variable used to pass values in to nic-nsg association child module variable"
}