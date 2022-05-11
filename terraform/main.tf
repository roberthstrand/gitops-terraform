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

resource "random_uuid" "test2" {
}

output "test" {
    value = random_uuid.test.result
}

output "test2" {
    value = random_uuid.test2.result
}