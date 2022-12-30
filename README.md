# How to Deploy Azure Active Directory (AD) Domain Services (AADDS) in Azure with Terraform
[![Terraform](https://img.shields.io/badge/terraform-v1.3+-blue.svg)](https://www.terraform.io/downloads.html)

Blog --> https://gmusumeci.medium.com/how-to-deploy-azure-active-directory-ad-domain-services-aadds-with-terraform-4a9551003d38

This code:

* Create the AADDS Service Principal
* Define the Azure Provider
* Create a Resource Group for AADDS
* Create a VNET for AADDS
* Create a Subnet for AADDS
* Create NSG (Network Security Group) to AADDS and attach it to the AADDS Subnet
* Create AD Admin Group
* Create an AD Admin User and add it to the AD Admin Group
* Deploy Azure AD Domain Services resource
