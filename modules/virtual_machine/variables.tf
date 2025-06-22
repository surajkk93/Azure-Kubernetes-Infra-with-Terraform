variable "vm_name" {}
variable "location" {}
variable "rg_name" {}
variable "subnet_id" {}
variable "ssh_public_key" {}
variable "admin_username" {
  default = "azureuser"
}
variable "vm_size" {
  default = "Standard_B1s"
}
