resource "azuread_application" "ciscomcd-controller" {
  owners       = [data.azuread_client_config.current.object_id]
  display_name = "${var.prefix}-ciscomcd-controller"
}

resource "azuread_service_principal" "ciscomcd-controller" {
  client_id    = azuread_application.ciscomcd-controller.client_id
  use_existing = true
}

resource "azuread_application_password" "ciscomcd_controller_secret" {
  display_name      = "ciscomcd-controller-secret"
  end_date_relative = "43800h" // 5 years
  application_id    = azuread_application.ciscomcd-controller.id
}
