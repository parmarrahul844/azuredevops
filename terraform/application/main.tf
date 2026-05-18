# resource "azurerm_resource_group" "rg1" {
#   name     = var.rg_name
#   location = var.region
# }

# resource "azurerm_user_assigned_identity" "rg1-identity" {
#   location            = var.region
#   name                = "tf-demo-identity"
#   resource_group_name = azurerm_resource_group.rg1.name
# }

# resource "azurerm_user_assigned_identity" "rg2-identity" {
#   location            = var.region
#   name                = "tf-demo-id2"
#   resource_group_name = azurerm_resource_group.rg1.name
# }

# Data Type for Resource Group And Manages Identity in the same Group.

# data "azurerm_resource_group" "rg3" {
#   name = "tf-demo2"
# }
# resource "azurerm_user_assigned_identity" "rg3" {
#   location            = var.region
#   name                = "tf-demo-id3"
#   resource_group_name = data.azurerm_resource_group.rg3.name
# }

# Storage Account Confiration

# resource "azurerm_storage_account" "storage_account" {
#   count                             = var.create_stgaccount ? 1 : 0 # Conditional variable Example
#   name                              = "storageaccountname"
#   resource_group_name               = var.rg_name
#   location                          = var.region
#   account_tier                      = var.account_tier
#   account_replication_type          = "GRS"
#   infrastructure_encryption_enabled = var.enable_encryption
#   nfsv3_enabled                     = false
#   min_tls_version                   = "TLS1_2"

#   tags = var.tags # map variable Example
# }

# resource "azurerm_virtual_network" "Vnet" {
#   name                = "example-network"
#   location            = var.region
#   resource_group_name = var.rg_name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   dynamic "subnet" {
#     for_each = var.subnet_cidrs
#     content {
#       name             = "subnet${index(var.subnet_cidrs, subnet.value) + 1}"
#       address_prefixes = [subnet.value]
#     }
#   }
#   tags = var.tags

# }
