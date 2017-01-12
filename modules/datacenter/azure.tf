provider "azurerm" {
  alias                      = "${var.name}"
  subscription_id            = "${var.azure_subscription_id}"
  client_id                  = "${var.azure_client_id}"
  client_secret              = "${var.azure_client_secret}"
  tenant_id                  = "${var.azure_tenant_id}"
  skip_provider_registration = false
}

# Create a resource group
resource "azurerm_resource_group" "net" {
  count    = "${var.provider == "azure" ? 1 : 0}"
  provider = "azurerm.${var.name}"
  name     = "x-${var.name}-net"
  location = "${var.azure_region}"
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "default" {
  count               = "${var.provider == "azure" ? 1 : 0}"
  name                = "x-${var.name}-net-01"
  address_space       = ["${var.net_prefix}.0.0/16"]
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.net.name}"
}

# Subnets
resource "azurerm_subnet" "frontend" {
  count                = "${var.provider == "azure" ? 1 : 0}"
  name                 = "x-${var.name}-net-fe-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["frontend"]}.0/24"
}

resource "azurerm_subnet" "backend" {
  count                = "${var.provider == "azure" ? 1 : 0}"
  name                 = "x-${var.name}-net-be-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["backend"]}.0/24"
}

resource "azurerm_subnet" "dmz" {
  count                = "${var.provider == "azure" ? 1 : 0}"
  name                 = "x-${var.name}-net-dmz-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["dmz"]}.0/24"
}

resource "azurerm_subnet" "database" {
  count                = "${var.provider == "azure" ? 1 : 0}"
  name                 = "x-${var.name}-net-db-01"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.net_prefix}.${var.subnet_prefixes["database"]}.0/24"
}
