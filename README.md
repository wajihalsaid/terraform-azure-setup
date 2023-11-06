# terraform-azure-ciscomcd
Create Azure AD App that is used by the Cisco Multicloud Defense Controller to manage your Azure Subscription(s). You can clone and use this as a module from your other terraform scripts. The following will be completed:
1) Create AD App Registration
2) Create App Service Prinicipal
3) Create App Secret
4) Create custom IAM Role
5) Inventory Event Subscription
6) Create User Assigned Identity for Gateways to access the key vault and blob storage for pcap
7) Accept Marketplace agreements for Cisco Multicloud Defense Gateway Image

# Requirements
1. Enable terraform to access your Azure account. Check here for the options https://registry.terraform.io/providers/hashicorp/azuread/latest/docs and https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
1. Set the default subscription to work on
1. Login to the Cisco Multicloud Defense Dashboard and generate an API Key using the instructions provided here: https://registry.terraform.io/providers/CiscoDevNet/ciscomcd/latest/docs

## Argument Reference

* `prefix` - (Required) App, Custom role are created with this prefix
* `subscription_guids_list` - (Optional) List of subscriptions (Ids) to which IAM role is assigned and prepared to be onboarded onto the Cisco Multicloud Defense Controller. Default is to use the current active subscription on the current login
* `ciscomcd_api_key_file` - (Required) Cisco Multicloud Defense API Key JSON file downloaded from the Cisco Multicloud Defense Controller. This is used add Azure account on Multicloud defense
* `ciscomcd_azure_cloud_account_name` - (Required) Name used to represent this AWS Account on the Cisco Multicloud Defense Controller.
* `region` - Required
* `webhook_endpoint` - (Required) Cisco Multicloud Defense provided Webhook Endpoint (ask Cisco)
* `inventory_regions` - (Required) List of Azure regions that Cisco Multicloud Defense Controller can monitor and update the inventory for dynamic security policies

## Outputs

User Assigned Identity ID: This account can be used when you add Cisco Multicloud Defense Gateways, so they can access the key vault and blob storage for pcap


## Running as root module
```
git clone https://github.com/wajihalsaid/terraform-azure-setup.git
cd terraform-azure-setup
cp values.sample values
```

Edit `values` file with the appropriate values for the variables

```
terraform init
terraform apply -var-file values
```
