#############################################
## Active Directory Domain Services - Main ##
#############################################

# Creating Azure AD Service Principal
resource "azuread_service_principal" "aadds" {
  application_id = "2565bd9d-da50-47d4-8b85-4c97f669dc36"
}

# Create Azure AD Domain Services Admin Group
resource "azuread_group" "aadds" {
  description      = "AAD DC Administrators"
  display_name     = "AAD DC Administrators"
  security_enabled = true
}

# Create Azure AD Domain Services Admin
resource "azuread_user" "aadds" {
  user_principal_name = var.admin_user_principal_name
  display_name        = var.admin_display_name
  password            = var.admin_password
}

# Add Admin User to the Admin Group
resource "azuread_group_member" "aadds" {
  group_object_id  = azuread_group.aadds.object_id
  member_object_id = azuread_user.aadds.object_id
}

# Deploy the Azure Active Directory Domain Services
resource "azurerm_active_directory_domain_service" "aadds" {
  depends_on = [
    azurerm_subnet_network_security_group_association.aadds
  ]

  name                = "aadds-${var.environment}"
  location            = azurerm_resource_group.aadds-rg.location
  resource_group_name = azurerm_resource_group.aadds-rg.name

  domain_name           = var.ad_domain_name
  sku                   = var.ad_domain_sku
  filtered_sync_enabled = false

  initial_replica_set {
    subnet_id = azurerm_subnet.aadds-subnet.id
  }

  notifications {
    additional_recipients = var.notify_additional_recipients
    notify_dc_admins      = var.notify_dc_admins
    notify_global_admins  = var.notify_global_admins
  }

  security {
    sync_kerberos_passwords = true
    sync_ntlm_passwords     = true
    sync_on_prem_passwords  = true
  }

  tags = {
    application = "Azure AD Directory Services"
    environment = var.environment
  }
}
