variable "project_name" {
  default = "terraform-ansible-project"
  type = string
}

variable "env" {
  default = "dev"
  type = string
}

variable "region" {
  default = "europe-central2"
  type = string
}

variable "vpc_self_link" {}

variable "mongodb_subnet" {}

variable "mongo_express_subnet" {}

variable "server_app_subnet" {}