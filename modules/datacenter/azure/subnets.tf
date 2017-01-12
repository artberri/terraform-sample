resource "azurerm_subnet" "frontend" {
  name                 = "x-${var.alias}-net-fe-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["frontend"]}.0/24"
}

resource "azurerm_subnet" "backend" {
  name                 = "x-${var.alias}-net-be-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["backend"]}.0/24"
}

resource "azurerm_subnet" "dmz" {
  name                 = "x-${var.alias}-net-dmz-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["dmz"]}.0/24"
}

resource "azurerm_subnet" "database" {
  name                 = "x-${var.alias}-net-db-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["database"]}.0/24"
}
