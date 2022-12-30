##################################################
## Active Directory Domain Services - Variables ##
##################################################

# active directory domain name
variable "ad_domain_name" {
  type        = string
  description = "This variable defines the name of Active Directory domain, for example kopicloud.com"
}

# active directory sku
variable "ad_domain_sku" {
  type        = string
  description = "This variable defines the sku for Active Directory Domain Services. Valid options are Standard, Enterprise or Premium"
  default     = "Standard"
}

# active directory admin user principal name
variable "admin_user_principal_name" {
  type        = string
  description = "This variable defines the use principal name of Admin for the Active Directory Domain Services, for example dsadmin@kopicloud.com"
}

# active directory admin display name
variable "admin_display_name" {
  type        = string
  description = "This variable defines the display name of Admin for the Active Directory Domain Services, for example Azure AD DS Admin"
  default     = "Azure AD DS Admin"
}

# active directory admin password
variable "admin_password" {
  type        = string
  description = "This variable defines the password of Admin for the Active Directory Domain Services"
}

# dc admins notification
variable "notify_dc_admins" {
  type        = bool
  description = "This variable is used to set notifications to DC admins"
  default     = true
}

# global admins notification
variable "notify_global_admins" {
  type        = bool
  description = "This variable is used to set notifications to global admins"
  default     = true
}

# additional recipients notifications
variable "notify_additional_recipients" {
  type        = list(string)
  description = "This variable is used to set notifications to additional recipients"
  default     = []
}
