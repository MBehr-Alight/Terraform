location                   = "westeurope"
resource_group_name        = "rg_Dev_TF_SPSEonAz" 
sharepoint_version         = "Subscription-Latest" #"2019"
admin_username             = "adm-behr"
admin_password             = "Highn00n12!!"
service_accounts_password  = "Highn00n12!!"
domain_fqdn                = "alight.dev"
number_additional_frontend = 2
enable_azure_bastion       = false
auto_shutdown_time         = "1830"
add_public_ip_address      = "Yes" #"SharePointVMsOnly", "No"