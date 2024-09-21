# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "azurerm_subscription" {
 subscription_id = ""
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

module "vm" {
  source = "./modules/vm.tf"
}

module "vmss" {
  source = "./modules/vmss.tf"
}

module "appplan" {
  source = "./modules/appserviceplan.tf"
}

module "webapp" {
  source = "./modules/webapp.tf"
}