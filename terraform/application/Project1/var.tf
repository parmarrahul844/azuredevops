variable "sub_id" {
  description = "Subscription ID"
  type        = string
  default     = "b3082952-6084-4e34-a107-fc9d20523f03"
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
  default     = "30243bf9-b084-42c2-a212-5a98220b6dde"
}

variable "rg" {
  description = "Resource Group Name"
  type        = string
  default     = "project1-rg"
}

variable "managed-id" {
  description = "Managed Identity Name"
  type        = string
  default     = "pro-id"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Central india"
}

