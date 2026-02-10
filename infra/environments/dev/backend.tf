terraform {
  backend "azurerm" {
    resource_group_name  = "clp-dev-westeurope-tfstate"
    storage_account_name = "clpdevwesteuropepegm3j"
    container_name       = "tfstate"
    key                  = "tfstate.dev.terraform.tfstate"
  }
}
