variable "aks_name" {}
variable "location" {}
variable "rg_name" {}
variable "node_count" {
  default = 1
}
variable "vm_size" {
  default = "Standard_B2s"
}
