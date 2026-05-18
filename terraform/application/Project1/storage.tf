# resource "azurerm_storage_account" "storage" {
#   name                     = "pro1storage"
#   resource_group_name      = var.rg
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_user_assigned_identity" "mi" {
#   name                = var.managed-id
#   location            = var.location
#   resource_group_name = var.rg
# }

# resource "azurerm_role_assignment" "blob_reader" {
#   scope                = azurerm_storage_account.storage.id
#   role_definition_name = "Storage Blob Data Reader"
#   principal_id         = azurerm_user_assigned_identity.mi.principal_id
#}

