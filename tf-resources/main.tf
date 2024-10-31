# # Create resource group
# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = var.location
# }

# Create App Service Plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.app_service_sku
  os_type             = var.app_service_os
  tags                = var.tags
}

# Create Web App
resource "azurerm_windows_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  tags                = var.tags
  site_config {}
  depends_on = [azurerm_service_plan.app_service_plan]
}

# Create SQL server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.adminuser
  administrator_login_password = var.adminpassword
  tags                         = var.tags
}

# Create SQL database
resource "azurerm_mssql_database" "sql_database" {
  count = var.create_sql_database ? 1 : 0
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sql_db_sku
  tags      = var.tags
  depends_on = [azurerm_mssql_server.sql_server]

}

# Create Azure Storage
resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_account_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_account_replication_type
  account_kind                  = var.storage_account_kind
  min_tls_version               = var.storage_account_min_tls_version
  public_network_access_enabled = false
  tags                          = var.tags
}