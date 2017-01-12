module "acme_aws_e1" {
  source = "./modules/single-instance/aws"
  subnet = "${module.e1_datacenter.subnets["frontend"]}"
  type   = "t2.small"
  ami    = "ami-ede2e889"
}
