# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "suffix" {
  description = "The suffix used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created, the default value is 'westeurope'"
  type    = string
  #default = "westeurope"
}

variable "environment" {
  description = "Define the kind of environment, like 'Dev', 'Prod'"
}

variable "customer" {
  description = "Who is the customer for this deployment?"
}

variable "project" {
  description = "Which project is it for the customer?"
}

variable "owner" {
  description = "Who will be the owner of the resources?"
}
