output "kube_config" {
  value = {
    client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
  }
  sensitive = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].host
  sensitive = true
}
