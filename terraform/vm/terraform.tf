terraform {
  required_version = ">= 1.1.0"
  cloud {
    organization = "robstr"

    workspaces {
      name = "gitops-vm"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  features {}
}

