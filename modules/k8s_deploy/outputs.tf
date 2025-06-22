output "service_name" {
  value = kubernetes_service.app.metadata[0].name
}

output "loadbalancer_ip" {
  value       = kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip
  description = "Public IP address of the LoadBalancer service"
}
