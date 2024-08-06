terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

# Configure Azure Provider
provider "azurerm" {
  features {}
}

# Configures AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "terraform-user"
}