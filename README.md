# Terraform 101 Talk Sample

## Install Terraform

``` bash
wget https://releases.hashicorp.com/terraform/0.8.3/terraform_0.8.3_linux_amd64.zip -O terraform.zip
unzip terraform.zip
rm terraform.zip
sudo mv terraform /usr/local/bin/terraform
```

## Run Sample

1. Create the `terraform.tfvars` file with the credentials to access Azure and Amazon WS ([How to get ARM credentials](https://www.terraform.io/docs/providers/azurerm/#creating-credentials) )
1. Run `terraform get`
1. Run `terraform plan`
1. Run `terraform apply`

