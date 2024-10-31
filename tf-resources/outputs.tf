# Output the Web App URL
output "web_app_url" {
  value = "https://${var.web_app_name}.azurewebsites.net"
}