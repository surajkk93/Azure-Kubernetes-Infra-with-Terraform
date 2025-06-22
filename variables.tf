variable "location" {
  default = "East US"
}

variable "rg_name" {
  default = "sk"
}
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}
variable "ssh_public_key" {
  description = "Public key for SSH access to the VM"
  type        = string
}
