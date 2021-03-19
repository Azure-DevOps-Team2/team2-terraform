# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      #source = "hashicorp/azurerm"
      #version = ">= 2.26"
      skip_provider_registration = true
    }
  }
}

provider "azurerm" {
    features {
         key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}