# Output for Virtual Machine (currently commented out)
# Uncomment if VM module is re-enabled
# output "vm_public_ip" {
#   value = module.virtual_machine.public_ip
# }

# output "vm_admin_username" {
#   value       = module.vm.admin_username
#   description = "Admin username of the VM"
# }

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
