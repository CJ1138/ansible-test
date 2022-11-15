provider "google" {
  project = var.project
}

module "gcp-https-server-vm1" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = var.vm1_name
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm1-iam.vm_service_account
  ip_address = module.gcp-static-ip1.address 
}

module "gcp-static-ip1" {
    source = "./tf-modules/gcp_static_ip"
    ip_name = var.ip1
}

module "gcp-static-ip2" {
    source = "./tf-modules/gcp_static_ip"
    ip_name = var.ip2
}

module "gcp-https-server-vm2" {
  source            = "./tf-modules/gcp-vms"
  vm_name           = var.vm2_name
  zone              = var.zone
  subnet            = module.gcp-network.subnet_id
  machine_type      = var.machine_type
  server_vm_account = module.vm2-iam.vm_service_account
  ip_address = module.gcp-static-ip2.address 
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
  service_account_name = var.service_account1_name
}

module "vm2-iam" {
  source               = "./tf-modules/gcp-iam"
  service_account_name = var.service_account2_name
}