provider "google" {
  project     = var.gcp_project_id
  credentials = file("./credentials/terraform-ansible-389111-credentials.json")
  region      = var.region
  zone        = var.zone
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  env          = var.env
}

module "eu_central2_subnets" {
  source               = "./modules/subnets"
  region               = "europe-central2"
  project_name         = var.project_name
  env                  = var.env
  image_builder_subnet = var.eu_central2_image_builder_subnet
  mongodb_subnet       = var.eu_central2_mongodb_subnet
  mongo_express_subnet = var.eu_central2_mongo_express_subnet
  server_app_subnet    = var.eu_central2_server_app_subnet
  vpc_self_link        = module.vpc.out_vpc_self_link
}

module "artifact_registry_repository" {
  source                     = "./modules/gcr"
  region                     = var.region
  project_id                 = var.gcp_project_id
  artifact_repository_id     = var.docker_images_repository_name
  artifact_repository_format = "DOCKER"
}

module "gce-mongodb-vm-instance" {
  source              = "./modules/gce"
  instance_name       = "mongodb-instance"
  machine_type        = "e2-medium"
  instance_tags       = ["database"]
  instance_subnetwork = module.eu_central2_subnets.out_mongodb_subnet
  vm_boot_image       = var.cos_boot_image
}

module "gce-server-app-vm-instance" {
  source              = "./modules/gce"
  instance_name       = "server-app-instance"
  machine_type        = "e2-medium"
  instance_tags       = ["server-app"]
  instance_subnetwork = module.eu_central2_subnets.out_server_app_subnet
  vm_boot_image       = var.cos_boot_image
}

module "gce-image-builder-vm-instance" {
  source              = "./modules/gce"
  instance_name       = "image-builder-instance"
  machine_type        = "e2-medium"
  instance_tags       = ["image-builder-app"]
  instance_subnetwork = module.eu_central2_subnets.out_image_builder_subnet
  vm_boot_image       = var.debian_boot_image
}