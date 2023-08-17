provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "tfdemoviz" {
    name = "rg_Dev_Terraform_Viz"
    location = "westeurope"
    tags =  {
        Kunde = "Intern"
        Umgebung = "Dev"
        SharePoint-Version = "Keine"
    }     
}

resource "azurerm_virtual_network" "tfdemoviz" {
    name = "vn_Terraform_Viz"
    location = "${azurerm_resource_group.tfdemoviz.location}"
    resource_group_name = "${azurerm_resource_group.tfdemoviz.name}"
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "tfdemoviz01" {
    name                 = "sn_Terraform_01"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "tfdemoviz02" {
    name                 = "sn_Terraform_02"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "tfdemoviz03" {
    name                 = "sn_Terraform_03"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "tfdemoviz04" {
    name                 = "sn_Terraform_04"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.4.0/24"]
}

resource "azurerm_subnet" "tfdemoviz05" {
    name                 = "sn_Terraform_05"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.5.0/24"]
}

resource "azurerm_subnet" "tfdemoviz06" {
    name                 = "sn_Terraform_06"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.6.0/24"]
}

resource "azurerm_subnet" "tfdemoviz07" {
    name                 = "sn_Terraform_07"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.7.0/24"]
}

resource "azurerm_subnet" "tfdemoviz08" {
    name                 = "sn_Terraform_08"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.8.0/24"]
}

resource "azurerm_subnet" "tfdemoviz09" {
    name                 = "sn_Terraform_09"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.9.0/24"]
}

resource "azurerm_subnet" "tfdemoviz10" {
    name                 = "sn_Terraform_10"
    resource_group_name  = azurerm_resource_group.tfdemoviz.name
    virtual_network_name = azurerm_virtual_network.tfdemoviz.name
    address_prefixes = ["10.0.10.0/24"]
}

#resource "azurerm_subnet" "tfdemoviz" {
#    
#    resource_group_name = "${azurerm_resource_group.tfdemoviz.name}"
#    virtual_network_name = "${azurerm_virtual_network.tfdemoviz.name}"
#    
#}

resource "azurerm_public_ip" "tfdemoviz" {
    name = "pip_Terraform_Viz_LB"
    allocation_method = "Static"
    location = "${azurerm_resource_group.tfdemoviz.location}"
    resource_group_name = "${azurerm_resource_group.tfdemoviz.name}"
}

resource "azurerm_lb" "tfdemoviz" {
    name = "lb_Terraform_Viz"
    location = "${azurerm_resource_group.tfdemoviz.location}"
    resource_group_name = "${azurerm_resource_group.tfdemoviz.name}"

    frontend_ip_configuration {
      name = "pip_Terraform_Viz"
      public_ip_address_id = "${azurerm_public_ip.tfdemoviz.id}"
    }
}

resource "azurerm_lb_backend_address_pool" "tfdemoviz" {
    loadbalancer_id = "${azurerm_lb.tfdemoviz.id}"
    name = "lb_BackendAdressPool"
}

resource "azurerm_network_interface" "tfdemoviz" {
    count = 2
    name = "nic_Terraform_Viz_${count.index}"
    location = "${azurerm_resource_group.tfdemoviz.location}"
    resource_group_name = "${azurerm_resource_group.tfdemoviz.name}"
  
    ip_configuration {
      name = "ip_Configuration"
      subnet_id = "${azurerm_subnet.tfdemoviz01.id}"
      private_ip_address_allocation = "Dynamic"
      #load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.tfdemoviz.id}"]
    }
}