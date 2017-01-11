module "eu_aws_datacenter" {
  source     = "./modules/datacenter/aws"
  alias      = "eu"
  region     = "eu-west-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  net_prefix = "10.0"
}

module "us_aws_datacenter" {
  source     = "./modules/datacenter/aws"
  alias      = "eu"
  region     = "us-west-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  net_prefix = "10.1"
}

module "eu_azure_datacenter" {
  source          = "./modules/datacenter/azure"
  alias           = "eu"
  subscription_id = "8baacd52-879c-4093-899c-5dea5d54c897"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
  net_prefix      = "10.2"
  location        = "West Europe"
}
