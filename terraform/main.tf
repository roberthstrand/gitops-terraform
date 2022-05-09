terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.3"
    }
  }
}

resource "random_uuid" "test" {
}

output "test" {
    value = random_uuid.test.result
}