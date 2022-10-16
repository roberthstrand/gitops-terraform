locals {
  location = lookup({
    "norway east"  = "norea"
    "west europe"  = "westeu"
    "north europe" = "noreu"
  }, lower(var.location))

  tags = {
    "source"  = "terraform"
    "purpose" = "demo"
  }
}
