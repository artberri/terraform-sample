resource "aws_instance" "default" {
  ami           = "${var.ami}"
  instance_type = "${var.type}"
  subnet_id     = "${var.subnet}"
  monitoring    = false
}

resource "aws_eip" "default" {
  instance = "${aws_instance.default.id}"
  vpc      = true
}
