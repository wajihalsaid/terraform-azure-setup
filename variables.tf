variable "prefix" {
  description = "Prefix for all the resources created"
  default     = "ciscomcd"
}

variable "subscription_guids_list" {
  description = "List of subscription ids (guids) that are assigned the IAM role so they can be onboarded onto the Multicloud Defense Controller. If the list is empty the current default subscription is assumed. All the subscriptions must be under the same tenant (AD)"
  type        = list(string)
  default     = []
}

variable "ciscomcd_api_key_file" {
  description = "Cisco Multicloud Defense API Key json file name downloaded from the Multicloud Defense Dashboard, required only when being run as root module"
  default     = ""
}

variable "ciscomcd_azure_cloud_account_name" {
  description = "Name used to represent this Azure Subscriptions on the Multicloud Defense Dashboard, if this is empty the AWS account is not added to the Multicloud Defense Controller"
  type        = list(string)
  default     = []
}

variable "region" {
  description = "Cisco Multicloud event subscription for an Azure subscription region"
  default     = ""
}

variable "webhook_endpoint" {
  description = "Cisco Multicloud Defense provided Webhook Endpoint (ask Cisco)"
  default     = ""
}

variable "inventory_regions" {
  description = "Regions that Cisco Multicloud Defense Controller can monitor and update the inventory for dynamic security policies: eastus, eastus2"
  default     = []
  type        = list(string)
}