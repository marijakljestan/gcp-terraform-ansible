provider "google" {
  project     = var.gcp_project_id
  credentials = file("./credentials/terraform-ansible-389111-credentials.json")
  region      = var.region
  zone        = "europe-central2-a"
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  env          = var.env
}

module "eu_central2_subnets" {
  source                           = "./modules/subnets"
  region                           = "europe-central2"
  project_name                     = var.project_name
  env                              = var.env
  mongodb_subnet       = var.eu_central2_mongodb_subnet
  mongo_express_subnet = var.eu_central2_mongo_express_subnet
  server_app_subnet    = var.eu_central2_server_app_subnet
  vpc_self_link                    = module.vpc.out_vpc_self_link
}

module "artifact_registry_repository" {
  source                     = "./modules/gcr"
  region                     = var.region
  project_id                 = var.gcp_project_id
  artifact_repository_id     = var.tf_backend_bucket_name
  artifact_repository_format = "DOCKER"
}

