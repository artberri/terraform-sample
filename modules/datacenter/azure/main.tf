provider "azurerm" {
  alias                      = "${var.alias}"
  subscription_id            = "${var.subscription_id}"
  client_id                  = "${var.client_id}"
  client_secret              = "${var.client_secret}"
  tenant_id                  = "${var.tenant_id}"
  skip_provider_registration = false
}

# Create a resource group
resource "azurerm_resource_group" "net" {
  provider = "azurerm.${var.alias}"
  name     = "x-${var.alias}-net"
  location = "${var.location}"
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "default" {
  name                = "x-${var.alias}-net-01"
  address_space       = ["${var.net_prefix}.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.net.name}"
}
