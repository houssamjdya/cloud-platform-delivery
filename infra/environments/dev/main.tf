terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "b2ecb73a-5b6c-4ab6-b7c9-c35a789aa070"
  features {}
}
