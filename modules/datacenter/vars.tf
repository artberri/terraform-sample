variable "provider" {
  type = "string"
}

variable "azure_region" {
  type    = "string"
  default = ""
}

variable "aws_region" {
  type    = "string"
  default = "us-west-1"
}

variable "name" {
  type = "string"
}

variable "aws_access_key" {
  type    = "string"
  default = ""
}

variable "aws_secret_key" {
  type    = "string"
  default = ""
}

variable "azure_subscription_id" {
  type    = "string"
  default = ""
}

variable "azure_client_id" {
  type    = "string"
  default = ""
}

variable "azure_client_secret" {
  type    = "string"
  default = ""
}

variable "azure_tenant_id" {
  type    = "string"
  default = ""
}

variable "net_prefix" {
  type = "string"
}

variable "subnet_prefixes" {
  type = "map"
}
