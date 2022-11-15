resource "google_compute_address" "static_ip" {
  name         = var.ip_name
  address_type = "EXTERNAL"
}