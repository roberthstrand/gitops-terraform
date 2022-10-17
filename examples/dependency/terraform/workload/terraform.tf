terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.27.0"
    }
  }
  cloud {
    organization = "robstr"
    workspaces {
      name = "demo-gitops-terraform-workload"
    }
  }
}

provider "azurerm" {
  features {}
}
