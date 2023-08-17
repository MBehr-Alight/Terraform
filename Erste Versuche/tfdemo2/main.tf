provider "azurerm" {
    client_id = "a1632429-8379-4543-8721-bf9db23cf5ec"
    client_secret = "cOd8Q~hBV6c~mQn0p_eAPkiHSR7vI~64chKv_bwg"
    tenant_id = "3f3bd27e-09a0-4fbb-af2d-8d568620df46"
    subscription_id = "bf44f0f2-7074-429a-8228-1ed755e05026"
    features {}
}

resource "azurerm_resource_group" "tfdemo2" {
    name = "rg_Dev_Terraform_2"
    location = "westeurope"
    tags = {
      Kunde = "Intern"
      Umgebung = "Dev"
      SharePoint-Version = "Keine"
    } 
}

resource "azurerm_storage_account" "tfdemo2" {
  name = "sargdevterraform2"
  location = "${azurerm_resource_group.tfdemo2.location}"
  resource_group_name = "${azurerm_resource_group.tfdemo2.name}"
  tags = "${azurerm_resource_group.tfdemo2.tags}"
  account_kind = "StorageV2"
  account_tier = "Standard"
  account_replication_type = "LRS"
  access_tier = "Hot"
}