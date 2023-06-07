locals {
  name_prefix = "${var.project_name}-${var.env}"
}

resource "google_compute_network" "vpc" {
  name = "${local.name_prefix}-vpc"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
}

resource "google_compute_firewall"  "allow-internal" {
  name  = "${local.name_prefix}-fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports = ["0-63535"]
  }
  source_ranges = [
    "192.168.0.0/24",
    "192.168.1.0/24",
    "192.168.2.0/24",
    "192.168.3.0/24"
  ]
}

resource "google_compute_firewall" "allow-http" {
  name = "${local.name_prefix}-fw-allow-http"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports = ["8080"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-ssh" {
  name = "${local.name_prefix}-fw-allow-ssh"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}