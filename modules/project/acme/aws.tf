module "acme_instance" {
  source     = "../../pattern/single-instance"
  datacenter = "${var.datacenter}"
  provider   = "${var.provider}"
  subnet     = "${var.subnet}"
  size       = ""
  os         = ""
}
