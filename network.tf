#########################
## Network - Resources ##
#########################

## Create the Resource Group ##
resource "azurerm_resource_group" "this" {
  name     = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}
