resource "azurerm_resource_group" "rg1" {
  name     = var.rg
  location = var.location
}

# -------------------------
# Managed Identity
# -------------------------

resource "azurerm_user_assigned_identity" "rg1-identity" {
  location            = var.location
  name                = var.managed-id
  resource_group_name = azurerm_resource_group.rg1.name
}

