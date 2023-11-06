resource "time_sleep" "wait_for_controller_account" {
  depends_on = [
    azurerm_role_assignment.ciscomcd_controller_role_assignment
  ]
  create_duration = "15s"
}

resource "ciscomcd_cloud_account" "azure1" {
  count = length(local.subscription_guids_list)
  depends_on = [
    time_sleep.wait_for_controller_account
  ]
  name                  = var.ciscomcd_azure_cloud_account_name[count.index]
  csp_type              = "AZURE"
  azure_directory_id    = data.azurerm_client_config.current.tenant_id
  azure_subscription_id = local.subscription_guids_list[count.index]
  azure_application_id  = azuread_application.ciscomcd-controller.client_id
  azure_client_secret   = azuread_application_password.ciscomcd_controller_secret.value
  inventory_monitoring {
    regions          = var.inventory_regions
    refresh_interval = 60
  }
}
