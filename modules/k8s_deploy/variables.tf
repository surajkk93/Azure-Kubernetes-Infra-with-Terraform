variable "app_name" {}
variable "image" {}
variable "replicas" {
  default = 1
}
variable "container_port" {
  default = 80
}
variable "service_port" {
  default = 80
}
