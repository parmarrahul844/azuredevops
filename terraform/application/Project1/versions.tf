# terraform {
#   required_version = ">= 1.14.7"
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = ">=4.72.0"
#     }
#   }
# }
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.81.0" # latest stable
    }
  }
}

