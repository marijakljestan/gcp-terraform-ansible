variable "gcp_project_id" {}

variable "project_name" {
  default = "terraform-ansible-project"
  type    = string
}

variable "credentials_file_path" {}

variable "env" {
  default = "dev"
  type    = string
}

variable "region" {
  default = "europe-central2"
  type    = string
}

variable "zone" {
  default = "europe-central2-b"
  type    = string
}

variable "docker_images_repository_name" {}

variable "tf_backend_bucket_name" {}

variable "cs_bucket_storage_class" {
  default = "REGIONAL"
  type    = string
}

variable "eu_central2_image_builder_subnet" {}

variable "eu_central2_mongodb_subnet" {}

variable "eu_central2_mongo_express_subnet" {}

variable "eu_central2_server_app_subnet" {}

variable "vpc_subnet_ranges" {
  type = list(string)
}

variable "cos_boot_image" {}

variable "debian_boot_image" {}