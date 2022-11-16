resource "google_compute_instance" "server-vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["http-server", "https-server", "allow-health-check"]

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      size  = 10
      image = "debian-cloud/debian-11"
    }
  }

      metadata = {
        ssh-keys = "chris:${file("~/.ssh/anstest.pub")}"
    }   

  network_interface {
    subnetwork = "default"
    access_config {
      nat_ip = var.ip_address
    }
  }

  # Uncomment to add startup script from local file. Example:
  #metadata_startup_script = "${file("./scripts/example-startup-script.sh")}"

  service_account {
    email  = var.server_vm_account
    scopes = ["cloud-platform"]
  }
}