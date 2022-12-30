###############################
## AADDS Network - Variables ##
###############################

variable "aadds-vnet-cidr" {
  type        = string
  description = "The CIDR of the Azure AD DS VNET"
}

variable "aadds-subnet-cidr" {
  type        = string
  description = "The CIDR for the Azure AD DS subnet"
}
