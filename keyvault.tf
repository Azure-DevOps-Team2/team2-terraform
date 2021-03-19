data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "azure_vault" {
  name                        = "AnimalNameDev"
  location                    = data.azurerm_resource_group.azuredevops.location
  resource_group_name         = data.azurerm_resource_group.azuredevops.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}
  /*access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Backup", "Delete", "Get List", "Purge", "Restore",
    ]

    secret_permissions = [
      "Get", "List", "Update", "Create", "Import",
    ]

    storage_permissions = [
      "Get", "List", "Update", "Create", "Import",
    ]
  }
}