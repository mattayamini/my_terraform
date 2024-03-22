variable "base_name" {
    type = string
    description = "The storage accuont base name"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}
variable "strg_acc_tier" {
  description = "Storage account tier"
  type        = string
  #default     = "Standard"  # Options: "Standard", "Premium"
}

variable "strg_acc_repli" {
  description = "Replication type for the storage account"
  type        = string
  #default     = "LRS"  # Options: "LRS", "GRS", "ZRS", "RA-GRS", "GZRS", "RA-GZRS"
}

variable "strg_acc_acs" {
  description = "Access tier for the storage account"
  type        = string
  #default     = "Hot"  # Options: "Hot", "Cool"
}