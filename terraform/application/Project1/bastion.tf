# resource "azurerm_subnet" "bastion_subnet" {
#   name                 = "AzureBastionSubnet" # MUST be exactly this
#   resource_group_name  = var.rg
#   virtual_network_name = var.location
#   address_prefixes     = ["10.0.3.0/27"] # example subnet range
# }

# resource "azurerm_public_ip" "bastion_pip" {
#   name                = "pro1-bastion-pip"
#   resource_group_name = var.rg
#   location            = var.location
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# resource "azurerm_bastion_host" "pro1_bastion" {
#   name                = "pro1-bastion"
#   location            = var.location
#   resource_group_name = var.rg

#   ip_configuration {
#     name                 = "bastion-ipconfig"
#     subnet_id            = azurerm_subnet.bastion_subnet.id
#     public_ip_address_id = azurerm_public_ip.bastion_pip.id
#   }
# }
