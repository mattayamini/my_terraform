terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_storage_account" "example" {
  name                     = "${var.base_name}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "${var.strg_acc_tier}"
  account_replication_type = "${var.strg_acc_repli}"
  access_tier              = "${var.strg_acc_acs}"
}