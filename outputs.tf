output "login_server" {
  description = "The URL used to log into the container registry"
  value       = azurerm_container_registry.this.login_server
}
