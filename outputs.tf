# Output: AKS cluster API server endpoint
output "aks_cluster_host" {
  value     = module.aks.host
  sensitive = true
}


output "app_service_name" {
  value = module.k8s_deploy.service_name
}

output "app_loadbalancer_ip" {
  value       = module.k8s_deploy.loadbalancer_ip
  description = "Access this IP in your browser to view the app"
}
