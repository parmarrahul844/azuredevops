# variable "region" {
#   description = "The region where resources will be created"
#   type        = string
#   default     = "Canada Central"
# }

# variable "rg_name" {
#   description = "The name of the resource group"
#   type        = string
#   default     = "tf-demo"
# }

# variable "account_tier" {
#   description = "The tier of the storage account"
#   type        = string
#   default     = "Standard"
# }

# variable "enable_encryption" {
#   description = "Enable encryption for the storage account"
#   type        = bool
#   default     = true
# }

# variable "create_stgaccount" {
#   description = "Flag to determine whether to create a storage account"
#   type        = bool
#   default     = true
# }

# variable "tags" {
#   description = "A map of tags to assign to the resources"
#   type        = map(string)
#   default = {
#     environment = "demo"
#   }
# }

# variable "subnet_cidrs" {
#   description = "A list of CIDR blocks for subnets"
#   type        = list(string)
#   default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#}