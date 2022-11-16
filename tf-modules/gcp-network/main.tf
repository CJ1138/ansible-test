resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "http" {
  name    = "default-allow-http"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80","8000"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "default-allow-https"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["443","4443"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "custom-allow-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "internal" {
  name    = "custom-allow-internal"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/24"]
}

resource "google_compute_firewall" "icmp" {
  name    = "custom-allow-icmp"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}