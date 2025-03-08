################################
## Azure Provider - Variables ##
################################

variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "azure-client-id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure-client-secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant ID"
}

#############################
## Application - Variables ##
#############################

# Company name 
variable "company" {
  type        = string
  description = "This variable defines the company name used to build resources"
  default     = "kopicloud"
}

# Application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
  default     = "verdaccio"
}

# Environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
  default     = "prod"
}

# Azure region
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "West Europe"
}

# Tags
variable "tags" {
  type        = map(string)
  description = "The collection of tags to be applied to all resources"
  default     = {}
}
