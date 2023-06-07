variable "project_id" {
  default = "terraform-ansible-389111"
  type = string
}

variable "region" {
    default = "europe-central2"
    type = string
}

variable "artifact_repository_id" {
  default = "iaac docker images repository"
  type = string
}

variable "artifact_repository_format" {
    default = "DOCKER"
    type = string
}
