resource "azurerm_virtual_network" "vnet_pro1" {
  name                = "pro1-vnet"
  location            = var.location
  resource_group_name = var.rg
  address_space       = ["10.0.0.0/16"]
}

# Subnet 1
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet_pro1.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet_pro1.name
  address_prefixes     = ["10.0.2.0/24"]
}