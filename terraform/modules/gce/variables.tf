variable "zone" {
  default = "europe-central2-a"
  type = string
}

variable "vm_boot_image" {
  type = map
}

variable "instance_name" {}

variable "instance_tags" {}

variable "machine_type" {}

variable "instance_subnetwork" {}