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
