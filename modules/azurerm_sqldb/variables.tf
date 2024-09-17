variable "sqldb_var" {
  type = map(any)
  description = "this variable holds parameters values needed to create mssql database(s)"
}

variable "client_ip_start" {
  type = string
  description = "this variable holds parameters values needed to create client's public ip to access mssql server"
}

variable "client_ip_end" {
  type = string
  description = "this variable holds parameters values needed to create client's public ip to access mssql server"
}