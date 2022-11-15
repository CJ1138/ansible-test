output "address" {
  description = "Reserved static IP address"
  value       = google_compute_address.static_ip.address
}