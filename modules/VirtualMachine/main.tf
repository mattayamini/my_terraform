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
resource "azurerm_virtual_network" "v1" {
  name                = var.virnet
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.addrspace]
}

resource "azurerm_subnet" "s1" {
  name                 = var.sunet
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.v1.name
  address_prefixes     = [var.snetaddrsp]
}

resource "azurerm_network_interface" "nic1" {
  name                = var.nic1
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.s1.id
    private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_windows_virtual_machine" "example-vm" {
  name                = "${var.vm_name}"
  computer_name   =     "example-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "${var.vm_size}"
  admin_username      = "${var.admin_usr}"
  admin_password      = "${var.admin_pswd}"
  network_interface_ids = [azurerm_network_interface.nic1.id,
  ]


  os_disk {
    caching              = "${var.os_disk_caching}"
    storage_account_type = "${var.os_disk_strg_acc}"
    
  }

  source_image_reference {
    publisher = "${var.src_img_pbl}"
    offer     = "${var.src_img_ofr}"
    sku       = "${var.src_img_sk}"
    version   = "${var.src_img_vrsn}"
  }
}