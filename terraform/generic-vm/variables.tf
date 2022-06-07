variable "name" {
  description = "Used for naming resources."
  type        = string
}

variable "location" {
  description = "Set the location for resources."
  type        = string
  default     = "Norway East"
}

variable "vm_password" {
  description = "Password for the local administrator account."
  type        = string
  sensitive   = true
}
