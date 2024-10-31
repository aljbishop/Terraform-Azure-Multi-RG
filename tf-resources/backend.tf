terraform {
  backend "azurerm" {
    resource_group_name  = "G17-POC"
    storage_account_name = "tfstateg17poc"
    container_name       = "sandbox-tfstate"
    key                  = "g17poc.terraform.tfstate"
  }
}
