variable "azurerm" {
    type    = map(string)
    default = {
        tenant_id       = "",
        subscription_id = "",
        
        #https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html#creating-a-service-principal-using-the-azure-cli
        client_id       = "",
        client_secret   = "",
    }
}

variable "location" {
    type = string
    default = "southeastasia"
}

variable "object_id" {
    type = string
    default = "e0829eb6-c352-4823-abb2-82a6c69d6a0f"
}


variable "tags" {
  type    = map(string)
  default   = {
      "environment"             = "production",
      "backup"                  = "false",
      "created_by"              = "terraform",