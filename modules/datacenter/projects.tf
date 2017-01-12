module "acme_project" {
  source     = "../project/acme"
  datacenter = "${var.name}"
  provider   = "${var.provider}"
  subnet     = "${azurerm_subnet.frontend.name ? azurerm_subnet.frontend.name : aws_subnet.frontend.id}"
}
