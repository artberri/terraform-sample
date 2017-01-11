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
  name     = "v-${var.alias}-net"
  location = "${var.location}"
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "network" {
  name                = "v-${var.alias}-net-01"
  address_space       = ["${var.net_prefix}.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.net.name}"

  subnet {
    name           = "frontend"
    address_prefix = "${var.net_prefix}.1.0/24"
  }

  subnet {
    name           = "backend"
    address_prefix = "${var.net_prefix}.2.0/24"
  }

  subnet {
    name           = "dmz"
    address_prefix = "${var.net_prefix}.3.0/24"
  }

  subnet {
    name           = "backend"
    address_prefix = "${var.net_prefix}.4.0/24"
  }
}
