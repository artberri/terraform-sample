variable "azure_subscription_id" {
  type = "string"
}

variable "azure_client_id" {
  type = "string"
}

variable "azure_client_secret" {
  type = "string"
}

variable "azure_tenant_id" {
  type = "string"
}

variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {
  type = "string"
}

variable "net_prefixes" {
  type = "map"

  default = {
    aws-eu   = "10.0"
    aws-us   = "10.1"
    azure-eu = "10.2"
    azure-us = "10.3"
  }
}

variable "subnet_prefixes" {
  type = "map"

  default = {
    frontend = "1"
    backend  = "2"
    dmz      = "3"
    database = "4"
  }
}
