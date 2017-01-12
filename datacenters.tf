module "e1_datacenter" {
  source          = "./modules/datacenter/aws"
  alias           = "e1"
  region          = "eu-west-2"
  access_key      = "${var.aws_access_key}"
  secret_key      = "${var.aws_secret_key}"
  net_prefix      = "${var.net_prefixes["aws-eu"]}"
  subnet_prefixes = "${var.subnet_prefixes}"
}

module "u1_datacenter" {
  source          = "./modules/datacenter/aws"
  alias           = "u1"
  region          = "us-west-1"
  access_key      = "${var.aws_access_key}"
  secret_key      = "${var.aws_secret_key}"
  net_prefix      = "${var.net_prefixes["aws-us"]}"
  subnet_prefixes = "${var.subnet_prefixes}"
}

module "e2_datacenter" {
  source          = "./modules/datacenter/azure"
  alias           = "e2"
  location        = "West Europe"
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
  net_prefix      = "${var.net_prefixes["azure-eu"]}"
  subnet_prefixes = "${var.subnet_prefixes}"
}

module "u2_datacenter" {
  source          = "./modules/datacenter/azure"
  alias           = "u2"
  location        = "West US"
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
  net_prefix      = "${var.net_prefixes["azure-us"]}"
  subnet_prefixes = "${var.subnet_prefixes}"
}
