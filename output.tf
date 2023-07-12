output "public-ssh-key" {
  value = file(var.public-key-location)
}

output "private-ssh-key" {
  value = file(var.private-key-location)
}

output "default-rg" {
  value= module.module-subnet.default-1
}