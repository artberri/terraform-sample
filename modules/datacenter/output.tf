output "network" {
  value = "${var.provider == "azure" ? azurerm_virtual_network.default.name : aws_vpc.default.id}"
}

output "subnets" {
  value = {
    frontend = "${var.provider == "azure" ? azurerm_subnet.frontend.name : aws_subnet.frontend.id}"
    backend  = "${var.provider == "azure" ? azurerm_subnet.backend.name : aws_subnet.backend.id}"
    dmz      = "${var.provider == "azure" ? azurerm_subnet.dmz.name : aws_subnet.dmz.id}"
    database = "${var.provider == "azure" ? azurerm_subnet.database.name : aws_subnet.database.id}"
  }
}
