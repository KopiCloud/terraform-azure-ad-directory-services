##########################
## AADDS Network - Main ##
##########################

# Create a resource group for AADDS
resource "azurerm_resource_group" "aadds-rg" {
  name     = "aadds-${var.environment}-rg"
  location = var.location
  
  tags = {
    application = "Azure AD Directory Services"
    environment = var.environment
  }
}

# Create the AADDS VNET
resource "azurerm_virtual_network" "aadds-vnet" {
  name                = "aadds-${var.environment}-vnet"
  address_space       = [var.aadds-vnet-cidr]
  resource_group_name = azurerm_resource_group.aadds-rg.name
  location            = azurerm_resource_group.aadds-rg.location

  tags = {
    application = "Azure AD Directory Services"
    environment = var.environment
  }
}

# Create a subnet for AADDS
resource "azurerm_subnet" "aadds-subnet" {
  name                 = "aadds-${var.environment}-subnet"
  address_prefixes     = [var.aadds-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.aadds-vnet.name
  resource_group_name  = azurerm_resource_group.aadds-rg.name
}

