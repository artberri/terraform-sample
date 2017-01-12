provider "aws" {
  alias      = "${var.name}"
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  count      = "${var.provider == "aws" ? 1 : 0}"
  provider   = "aws.${var.name}"
  cidr_block = "${var.net_prefix}.0.0/16"
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  count    = "${var.provider == "aws" ? 1 : 0}"
  provider = "aws.${var.name}"
  vpc_id   = "${aws_vpc.default.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  count                  = "${var.provider == "aws" ? 1 : 0}"
  provider               = "aws.${var.name}"
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

#Subnets
resource "aws_subnet" "frontend" {
  count                   = "${var.provider == "aws" ? 1 : 0}"
  provider                = "aws.${var.name}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.net_prefix}.${var.subnet_prefixes["frontend"]}.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "backend" {
  count                   = "${var.provider == "aws" ? 1 : 0}"
  provider                = "aws.${var.name}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.net_prefix}.${var.subnet_prefixes["backend"]}.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "dmz" {
  count                   = "${var.provider == "aws" ? 1 : 0}"
  provider                = "aws.${var.name}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.net_prefix}.${var.subnet_prefixes["dmz"]}.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "database" {
  count                   = "${var.provider == "aws" ? 1 : 0}"
  provider                = "aws.${var.name}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.net_prefix}.${var.subnet_prefixes["database"]}.0/24"
  map_public_ip_on_launch = true
}
