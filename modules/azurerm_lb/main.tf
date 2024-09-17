data "azurerm_public_ip" "pubip" {
  name                = "adil_pubip2"
  resource_group_name = "adil_rg1"
}

# Create Public Load Balancer
resource "azurerm_lb" "lb" {
  name                = var.lb_var.lb_name
  location            = var.lb_var.lb_location
  resource_group_name = var.lb_var.lb_rgname
  frontend_ip_configuration {
    name                 = var.lb_var.frontendipconf_name
    public_ip_address_id = data.azurerm_public_ip.pubip.id
  }
  sku = "Standard"
}

resource "azurerm_lb_backend_address_pool" "lb_be_pool" {
  name                 = var.lb_var.bepool_name
  loadbalancer_id      = azurerm_lb.lb.id
}

# Associate Network Interface to the Backend Pool of the Load Balancer
resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_pool" {
  for_each = var.bepool_var
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ipconfig_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_be_pool.id
}





resource "azurerm_lb_probe" "lbprobe" {
  name = var.lb_var.lbprobe_name
  loadbalancer_id = azurerm_lb.lb.id
  port = 80
  protocol = "Tcp"
  interval_in_seconds = 5
  number_of_probes = 2
}

resource "azurerm_lb_rule" "lb_rule" {
  name = var.lb_var.lb_rule_name
  loadbalancer_id = azurerm_lb.lb.id
  frontend_ip_configuration_name = var.lb_var.frontendipconf_name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_be_pool.id]
  protocol = "Tcp"
  frontend_port = "80"
  backend_port = "80"
  probe_id = azurerm_lb_probe.lbprobe.id
}
