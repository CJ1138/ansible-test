output "static_ip_address1" {
  description = "Static external IP address reserved for the VM1."
  value       = module.gcp-static-ip1.address
}

output "static_ip_address2" {
  description = "Static external IP address reserved for the VM2."
  value       = module.gcp-static-ip2.address
}