
module "sharepoint" {
  source               = "Yvand/sharepoint/azurerm"
  location              = "West Europe"
  resource_group_name   = "<resourceGroupName>"
  sharepoint_version    = "Subscription-Latest"
  admin_username        = "yvand"
  admin_password        = "<password>"
  add_public_ip_address = "SharePointVMsOnly"
  rdp_traffic_allowed   = "<yourInternetPublicIP>"
}










/*locals {
  common_tags = {
    Umgebung = "${var.environment}"
    Kunde = "${var.customer}"
    Projekt = "${var.project}"
    Besitzer = "${var.owner}"
  }
  resourcename = "${var.project}_${var.suffix}"
}

resource "azurerm_resource_group" "tfdemo4" {
  name     = "rg_${var.environment}_${var.customer}_${var.project}_${var.suffix}"
  location = "${var.location}"
  tags = "${local.common_tags}"
}

resource "azurerm_virtual_network" "tfdemo4" {
  name = "vn_${local.resourcename}"
  location = "${var.location}"
  tags = "${local.common_tags}"
  resource_group_name = "${azurerm_resource_group.tfdemo4.name}"
  address_space = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "Frontend" {
  name = "sn_${local.resourcename}_Frontend"
  resource_group_name = azurerm_resource_group.tfdemo4.name
  virtual_network_name = azurerm_virtual_network.tfdemo4.name
  address_prefixes = ["10.1.1.0/24"]
}

 resource "azurerm_subnet" "Backend" {
  name = "sn_${local.resourcename}_Backend"
  resource_group_name = azurerm_resource_group.tfdemo4.name
  virtual_network_name = azurerm_virtual_network.tfdemo4.name
  address_prefixes = ["10.1.2.0/24"]
}

 resource "azurerm_subnet" "Database" {
  name = "sn_${local.resourcename}_Database"
  resource_group_name = azurerm_resource_group.tfdemo4.name
  virtual_network_name = azurerm_virtual_network.tfdemo4.name
  address_prefixes = ["10.1.3.0/24"]
}

resource "azurerm_network_interface" "vm1" {
  name                = "nic_${local.resourcename}"
  resource_group_name = azurerm_resource_group.tfdemo4.name
  location            = "${var.location}"

  ip_configuration {
    name                          = "Frontend"
    subnet_id                     = azurerm_subnet.Frontend.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm1" {
  name                            = "vm_${local.resourcename}"
  resource_group_name             = azurerm_resource_group.tfdemo4.name
  location                        = "${var.location}"
  tags                            = "${local.common_tags}"
  size                            = "Standard_F2s_V2"
  admin_username                  = "adminuser"
  admin_password                  = "Highn00n12!!"
  computer_name                   = "DC01"
  #hotpatching_enabled             = true
  #enable_automatic_updates        = true
  license_type                    = "Windows_Server"
  custom_data                     = base64encode("Hello World!")
  network_interface_ids = [
    azurerm_network_interface.vm1.id,
  ]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}*/

