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
  default = "europe-central2-a"
  type    = string
}

variable "tf_backend_bucket_name" {}

variable "cs_bucket_storage_class" {
  default = "REGIONAL"
  type    = string
}

variable "eu_central2_mongodb_subnet" {}

variable "eu_central2_mongo_express_subnet" {}

variable "eu_central2_server_app_subnet" {}

variable "mongodb_env_variables" {}

variable "server_env_variables" {}