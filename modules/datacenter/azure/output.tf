output "network" {
  value = "${azurerm_virtual_network.default.name}"
}

output "subnets" {
  value = {
    frontend = "${azurerm_subnet.frontend.name}"
    backend  = "${azurerm_subnet.backend.name}"
    dmz      = "${azurerm_subnet.dmz.name}"
    database = "${azurerm_subnet.database.name}"
  }
}
