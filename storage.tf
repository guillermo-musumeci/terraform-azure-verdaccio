#################################
## Storage Account - Resources ##
#################################

## Create Azure Storage Account For Persistent Storage ##
resource "azurerm_storage_account" "verdaccio_storage" {
  name                     = "${lower(replace(var.company," ",""))}verdacciost"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

## Create Azure Storage Share ##
resource "azurerm_storage_share" "verdaccio_share" {
  name               = "verdaccio"
  storage_account_id = azurerm_storage_account.verdaccio_storage.id
  quota              = 100
}
