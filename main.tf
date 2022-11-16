provider "google" {
  project = var.project
}
module "gcp-https-server-vm1" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = "web01"
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm1-iam.vm_service_account
  ip_address        = module.gcp-static-ip1.address
}

module "gcp-https-server-vm2" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = "web02"
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm2-iam.vm_service_account
  ip_address        = module.gcp-static-ip2.address
}

module "gcp-https-server-vm3" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = "loadbalancer"
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm3-iam.vm_service_account
  ip_address        = module.gcp-static-ip3.address
}

module "gcp-https-server-vm4" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = "db01"
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm4-iam.vm_service_account
  ip_address        = module.gcp-static-ip4.address
}

module "gcp-static-ip1" {
  source  = "./tf-modules/gcp_static_ip"
  ip_name = "ip1"
}

module "gcp-static-ip2" {
  source  = "./tf-modules/gcp_static_ip"
  ip_name = "ip2"
}

module "gcp-static-ip3" {
  source  = "./tf-modules/gcp_static_ip"
  ip_name = "ip3"
}

module "gcp-static-ip4" {
  source  = "./tf-modules/gcp_static_ip"
  ip_name = "ip4"
}

module "gcp-apis" {
  source  = "./tf-modules/gcp-apis"
  project = var.project
}

module "gcp-network" {
  source     = "./tf-modules/gcp-network"
  project    = var.project
  network    = var.network
  subnet     = var.subnet
  cidr_range = var.cidr_range
  region     = var.region
}

module "vm1-iam" {
  source               = "./tf-modules/gcp-iam"
  service_account_name = "vm1account"
}

module "vm2-iam" {
  source               = "./tf-modules/gcp-iam"
  service_account_name = "vm2account"
}

module "vm3-iam" {
  source               = "./tf-modules/gcp-iam"
  service_account_name = "vm3account"
}

module "vm4-iam" {
  source               = "./tf-modules/gcp-iam"
  service_account_name = "vm4account"
}