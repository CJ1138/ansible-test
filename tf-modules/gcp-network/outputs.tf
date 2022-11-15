output "subnet_id" {
  description = "ID for the created subnet."
  value       = google_compute_subnetwork.vpc_subnet.id
}