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

# Zasób azurerm_storage_container
resource "azurerm_storage_container" "variables_sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.variables_sa.name
  container_access_type = var.storage_container_access_type
}

# Zasób azurerm_storage_blob
resource "azurerm_storage_blob" "variables_sb" {
  name                   = "variablesblob"
  storage_account_name   = azurerm_storage_account.variables_sa.name
  storage_container_name = azurerm_storage_container.variables_sc.name
  type                   = "Block"
  source                 = "C:\Users\X$X\Documents\GitHub\iac-terraform-azure\azure-blob-storage"
}
 
