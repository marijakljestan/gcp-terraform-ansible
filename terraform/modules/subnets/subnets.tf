locals {
  name_prefix = "${var.project_name}-${var.env}"
}

resource "google_compute_subnetwork" "image-builder-subnet" {
  name = "${local.name_prefix}-image-builder-subnet"
  network =  "${var.vpc_self_link}"
  ip_cidr_range = "${var.image_builder_subnet}"
  region = "${var.region}"
}

resource "google_compute_subnetwork" "mongodb-subnet" {
  name = "${local.name_prefix}-mongodb-subnet"
  network =  "${var.vpc_self_link}"
  ip_cidr_range = "${var.mongodb_subnet}"
  region = "${var.region}"
}

resource "google_compute_subnetwork" "mongo-express-subnet" {
  name = "${local.name_prefix}-mongo-express-subnet"
  network = "${var.vpc_self_link}"
  ip_cidr_range = "${var.mongo_express_subnet}"
  region = "${var.region}"
}

resource "google_compute_subnetwork" "server-app-subnet" {
  name = "${local.name_prefix}-server-app-subnet"
  network = "${var.vpc_self_link}"
  ip_cidr_range = "${var.server_app_subnet}"
  region = "${var.region}"
}