module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
}
module "network" {
  source          = "./modules/network"
  vnet_name       = "portfolio-vnet"
  address_space   = ["10.0.0.0/16"]
  subnet_name     = "default-subnet"
  subnet_prefixes = ["10.0.1.0/24"]
  location        = var.location
  rg_name         = module.resource_group.rg_name
  nsg_id          = module.nsg.nsg_id
}
module "nsg" {
  source   = "./modules/nsg"
  nsg_name = "portfolio-nsg"
  location = var.location
  rg_name  = module.resource_group.rg_name
}
module "aks" {
  source     = "./modules/aks"
  aks_name   = "suraj-aks"
  location   = var.location
  rg_name    = module.resource_group.rg_name
  node_count = 1
  vm_size    = "Standard_B2s"
}
provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = module.aks.kube_config.client_certificate
  client_key             = module.aks.kube_config.client_key
  cluster_ca_certificate = module.aks.kube_config.cluster_ca_certificate
}
module "k8s_deploy" {
  source          = "./modules/k8s_deploy"
  app_name        = "year-progress"
  image           = "surajkk93/year_progress:v1"
  replicas        = 1
  container_port  = 80
  service_port    = 80
}
