data "azurerm_resource_group" "azuredevops" {
  name = "DevOps-2021-03-18-team-02-dev"
}

resource "azurerm_app_service_plan" "azure_service_plan" {
  name                = "team2-appserviceplan-dev"
  location            = data.azurerm_resource_group.azuredevops.location
  resource_group_name = data.azurerm_resource_group.azuredevops.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "azure_webapp" {
  name                = "team2-app-service"
  location            = data.azurerm_resource_group.azuredevops.location
  resource_group_name = data.azurerm_resource_group.azuredevops.name
  app_service_plan_id = azurerm_app_service_plan.azure_service_plan.id

  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
    scm_type                 = "None"
  }

  #app_settings = {
   # "SOME_KEY" = "some-value"
  #}
}