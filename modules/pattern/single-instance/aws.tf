module "server" {
  source   = "../vm"
  provider = "${var.provider}"
  ami      = "eee"
  type     = "eee"
  subnet   = "${var.subnet}"
}

resource "aws_eip" "default" {
  count    = "${var.provider == "aws" ? 1 : 0}"
  instance = "${module.server.instance_id}"
  vpc      = true
}

resource "aws_ebs_volume" "default" {
  count             = "${var.provider == "aws" ? 1 : 0}"
  availability_zone = "eu-west-1a"
  type              = "gp2"
  size              = 10
}

resource "aws_volume_attachment" "default_ebs_att" {
  count       = "${var.provider == "aws" ? 1 : 0}"
  device_name = "xvdh"
  volume_id   = "${aws_ebs_volume.default.id}"
  instance_id = "${module.server.instance_id}"
}
