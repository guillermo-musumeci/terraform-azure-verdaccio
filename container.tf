######################################
## Azure Container Group - Resouces ##
######################################

## Create Container Instance for Verdaccio ##
resource "azurerm_container_group" "verdaccio" {
  name                = "${lower(replace(var.company," ","-"))}-verdaccio-container"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  os_type             = "Linux"

  container {
    name   = "verdaccio"
    image  = "verdaccio/verdaccio:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 4873
      protocol = "TCP"
    }

    volume {
      name       = "verdaccio-data"
      mount_path = "/verdaccio/storage"
      
      share_name          = azurerm_storage_share.verdaccio_share.name
      storage_account_name = azurerm_storage_account.verdaccio_storage.name
      storage_account_key  = azurerm_storage_account.verdaccio_storage.primary_access_key
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "${lower(replace(var.company," ","-"))}-verdaccio"

  tags = var.tags

  depends_on = [ azurerm_storage_account.verdaccio_storage ]
}

####################################
## Azure Container Group - Output ##
####################################

output "OUT_verdaccio_url" {
  value       = "http://${azurerm_container_group.verdaccio.fqdn}:4873"
  description = "The URL of Verdaccio Package Manager"
}
