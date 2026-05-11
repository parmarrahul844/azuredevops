resource "azurerm_resource_group" "rg1" {
  name     = "tf-demo"
  location = "Canada Central"
}

resource "azurerm_user_assigned_identity" "rg1-identity" {
  location            = "Canada Central"
  name                = "tf-demo-identity"
  resource_group_name = azurerm_resource_group.rg1.name
}