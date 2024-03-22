terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "res"
  location = "East US"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "uniquestorage321"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "East US"
  strg_acc_tier = "Standard"
  strg_acc_repli = "LRS"
  strg_acc_acs = "Hot"
}
module "VirtualMachine"{
    source = "./VirtualMachine"
    resource_group_name = module.ResourceGroup.rg_name_out
    location = "East US"
    virnet = "vnet_1"
    addrspace = "10.0.0.0/16"
    sunet = "snet_1"
    snetaddrsp = "10.0.1.0/24"
    nic1 = "niccard_1"
    vm_name = "v_machine_1"
    vm_size = "Standard_B1s"
    admin_usr = "adminuser"
    admin_pswd = "P@$$w0rd1234!"
    os_disk_caching = "ReadWrite"
    os_disk_strg_acc = "Standard_LRS"
    src_img_pbl = "MicrosoftWindowsServer"
    src_img_ofr = "WindowsServer"
    src_img_sk = "2016-Datacenter"
    src_img_vrsn = "latest"
}