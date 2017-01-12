resource "aws_instance" "default" {
  count         = "${var.provider == "aws" ? 1 : 0}"
  ami           = "${var.ami}"
  instance_type = "${var.type}"
  subnet_id     = "${var.subnet}"
  monitoring    = false
}
