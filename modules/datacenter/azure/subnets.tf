resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.1.0/24"
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.2.0/24"
}

resource "azurerm_subnet" "dmz" {
  name                 = "dmz"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.3.0/24"
}

resource "azurerm_subnet" "database" {
  name                 = "database"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.4.0/24"
}
