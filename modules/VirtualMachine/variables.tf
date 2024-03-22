variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}
variable "virnet"{
    type = string
    description = "name of the virtual network"
}

variable "addrspace"{
    type = string
    description = "cidr address space for virtual network"
}

variable "sunet"{
    type = string
    description ="name of the subnet"
}
variable "nic1"{
    type = string
    description ="name of the nic1"
}
variable "snetaddrsp"{
    type = string
    description = "cidr address space for subnet"
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  #default     = "V-machine"
}

variable "admin_usr" {
  description = "Admin username for the virtual machine"
  type        = string
  #default     = "adminuser"
}

variable "admin_pswd" {
  description = "Admin password for the virtual machine"
  type        = string
  #default     = "P@$$w0rd1234!"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  #default     = "Standard_B1s"
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  #default     = "ReadWrite"
}

variable "os_disk_strg_acc" {
  description = "Storage account type for the OS disk"
  type        = string
  #default     = "Standard_LRS"
}

variable "src_img_pbl" {
  description = "Publisher of the source image"
  type        = string
  #default     = "MicrosoftWindowsServer"
}

variable "src_img_ofr" {
  description = "Offer of the source image"
  type        = string
  #default     = "WindowsServer"
}

variable "src_img_sk" {
  description = "SKU of the source image"
  type        = string
  #default     = "2016-Datacenter"
}

variable "src_img_vrsn" {
  description = "Version of the source image"
  type        = string
  #default     = "latest"
}