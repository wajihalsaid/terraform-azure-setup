terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2"
      # using older version as we saw some issues creating the application with 2.x msgraph api, it was probably temporary
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    time = {
      source = "hashicorp/time"
    }
    ciscomcd = {
      source = "CiscoDevNet/ciscomcd"
      #version = "0.2.3"
    }
  }
}

provider "azuread" {
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
provider "ciscomcd" {
  # Configuration options
  api_key_file = file(var.ciscomcd_api_key_file)
}