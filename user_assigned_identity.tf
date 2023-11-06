resource "azurerm_resource_group" "Assigned-Identity" {
  name     = "Assigned-Identity"
  location = var.region
}

resource "azurerm_user_assigned_identity" "UAI" {
  name                = "${var.prefix}-gateway-uai"
  resource_group_name = azurerm_resource_group.Assigned-Identity.name
  location            = azurerm_resource_group.Assigned-Identity.location
}
resource "azurerm_role_assignment" "UAI_strg" {
  count                = length(local.subscription_ids_list)
  scope                = local.subscription_ids_list[count.index]
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.UAI.principal_id
}

resource "azurerm_role_assignment" "UAI_keyvault" {
  count                = length(local.subscription_ids_list)
  scope                = local.subscription_ids_list[count.index]
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.UAI.principal_id
}