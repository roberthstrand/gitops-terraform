variable "greeting" {
  description = "Greeting used for the demo"
  type        = string
  default     = "Hello"
}

variable "subject" {
  description = "The subject the greeting will be presented to"
  type        = string
  default     = "GitOps Days"
}

output "message" {
  value = format("%s, %s!", var.greeting, var.subject)
}
