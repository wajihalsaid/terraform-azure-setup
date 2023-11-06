# Accept Marketplace agreements for Cisco Multicloud Defense Gateway Image
resource "azurerm_marketplace_agreement" "valtix" {
  publisher = "valtix"
  offer     = "datapath"
  plan      = "valtix_dp_image"
}