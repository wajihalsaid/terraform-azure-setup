resource "azurerm_resource_group" "DEFAULT-EVENTGRID" {
  name     = "DEFAULT-EVENTGRID"
  location = var.region
}

resource "azurerm_eventgrid_system_topic" "eventgrid_system_topic" {
  count                  = length(local.subscription_guids_list)
  name                   = "${local.subscription_guids_list[count.index]}-eventgrid-system-topic"
  resource_group_name    = azurerm_resource_group.DEFAULT-EVENTGRID.name
  location               = "Global"
  topic_type             = "Microsoft.Resources.Subscriptions"
  source_arm_resource_id = local.subscription_ids_list[count.index]
}

resource "azurerm_eventgrid_system_topic_event_subscription" "eventgrid_inventory" {
  count               = length(local.subscription_guids_list)
  name                = "${var.prefix}-controller-inventory"
  system_topic        = azurerm_eventgrid_system_topic.eventgrid_system_topic[count.index].name
  resource_group_name = azurerm_resource_group.DEFAULT-EVENTGRID.name
  webhook_endpoint {
    url = var.webhook_endpoint
  }
  included_event_types = ["Microsoft.Resources.ResourceWriteSuccess", "Microsoft.Resources.ResourceDeleteSuccess", "Microsoft.Resources.ResourceActionSuccess"]

}
