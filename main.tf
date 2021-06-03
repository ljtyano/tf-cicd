#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block

terraform {
    backend azurerm {
    resource_group_name = "tfrmRG"
    storage_account_name = "tfrm"
    container_name = "tfrm-container"
    sas_token = "?sv=2020-02-10&ss=bfqt&srt=co&sp=rwdlacuptfx&se=2021-06-03T13:57:31Z&st=2021-06-03T05:57:31Z&spr=https&sig=18Rn0t8p3G0tH2%2BZ%2F1tX2WfvTYYLn07lLECIijYYR2c%3D" 
  }
}

# Provider Block

provider "azurerm" {
    version         =   "~> 2.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}




provider "azuread" {
    version         =   ">= 0.11"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}


module "virtualnetwork" {
    source  =   "./azure/virtualnetwork"
}

