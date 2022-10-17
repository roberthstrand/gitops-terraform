variable "deployment_name" {
  description = "The deployment name used for creating the resources."
  type        = string
}

variable "location" {
  description = "The location where the resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet that the vm will use."
  type        = string
}

variable "admin_password" {
  description = "The password for the admin user."
  type        = string
  sensitive   = true
}
