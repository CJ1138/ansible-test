output "web01_address1" {
  description = "Static external IP address reserved for the VM1."
  value       = module.gcp-static-ip1.address
}

output "web02_address2" {
  description = "Static external IP address reserved for the VM2."
  value       = module.gcp-static-ip2.address
}

output "loadbalancer_address3" {
  description = "Static external IP address reserved for the VM1."
  value       = module.gcp-static-ip3.address
}

output "db01_address4" {
  description = "Static external IP address reserved for the VM2."
  value       = module.gcp-static-ip4.address
}