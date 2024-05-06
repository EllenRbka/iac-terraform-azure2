# Zasób azurerm_resource_group
resource "azurerm_resource_group" "variables_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Zasób azurerm_storage_account
resource "azurerm_storage_account" "variables_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.variables_rg.name
  location                 = azurerm_resource_group.variables_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

# Zasób azurerm_app_service_plan
resource "azurerm_app_service_plan" "variables_asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.variables_rg.location
  resource_group_name = azurerm_resource_group.variables_rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

# Zasób azurerm_function_app
resource "azurerm_function_app" "variables_fa" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.variables_rg.location
  resource_group_name        = azurerm_resource_group.variables_rg.name
  app_service_plan_id        = azurerm_app_service_plan.variables_asp.id
  storage_account_name       = azurerm_storage_account.variables_sa.name
  storage_account_access_key = azurerm_storage_account.variables_sa.primary_access_key
}

# Zasób azurerm_function_app_function
resource "azurerm_function_app_function" "variables_faf" {
  name                        = "test_function"
  resource_group_name         = azurerm_resource_group.variables_rg.name
  function_app_name           = azurerm_function_app.variables_fa.name
  storage_account_connection_string = azurerm_storage_account.variables_sa.primary_connection_string
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  }

  trigger {
    name = "http_trigger"
    type = "httpTrigger"
    direction = "in"
  }
}
 
