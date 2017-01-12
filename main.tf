module "eu_aws_datacenter" {
  source                = "./modules/datacenter"
  provider              = "aws"
  name                  = "e1"
  aws_region            = "eu-west-2"
  net_prefix            = "${var.net_prefixes["aws-eu"]}"
  subnet_prefixes       = "${var.subnet_prefixes}"
  azure_subscription_id = "${var.azure_subscription_id}"
  azure_client_id       = "${var.azure_client_id}"
  azure_client_secret   = "${var.azure_client_secret}"
  azure_tenant_id       = "${var.azure_tenant_id}"
  aws_access_key        = "${var.aws_access_key}"
  aws_secret_key        = "${var.aws_secret_key}"
}

module "us_aws_datacenter" {
  source                = "./modules/datacenter"
  provider              = "aws"
  name                  = "u1"
  aws_region            = "us-west-1"
  net_prefix            = "${var.net_prefixes["aws-us"]}"
  subnet_prefixes       = "${var.subnet_prefixes}"
  azure_subscription_id = "${var.azure_subscription_id}"
  azure_client_id       = "${var.azure_client_id}"
  azure_client_secret   = "${var.azure_client_secret}"
  azure_tenant_id       = "${var.azure_tenant_id}"
  aws_access_key        = "${var.aws_access_key}"
  aws_secret_key        = "${var.aws_secret_key}"
}

module "eu_azure_datacenter" {
  source                = "./modules/datacenter"
  provider              = "azure"
  name                  = "e2"
  azure_region          = "West Europe"
  net_prefix            = "${var.net_prefixes["azure-eu"]}"
  subnet_prefixes       = "${var.subnet_prefixes}"
  azure_subscription_id = "${var.azure_subscription_id}"
  azure_client_id       = "${var.azure_client_id}"
  azure_client_secret   = "${var.azure_client_secret}"
  azure_tenant_id       = "${var.azure_tenant_id}"
}

module "us_azure_datacenter" {
  source                = "./modules/datacenter"
  provider              = "azure"
  name                  = "u2"
  azure_region          = "West US"
  net_prefix            = "${var.net_prefixes["azure-us"]}"
  subnet_prefixes       = "${var.subnet_prefixes}"
  azure_subscription_id = "${var.azure_subscription_id}"
  azure_client_id       = "${var.azure_client_id}"
  azure_client_secret   = "${var.azure_client_secret}"
  azure_tenant_id       = "${var.azure_tenant_id}"
}
