data "google_compute_default_service_account" "default" {
}

data "google_compute_image" "vm_image" {
  family  = var.vm_boot_image["family"]
  project = var.vm_boot_image["project"]
}

resource "google_compute_instance" "vm-cos"  {
  name = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  tags = "${var.instance_tags}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
    }
  }

  network_interface {
    subnetwork = "${var.instance_subnetwork}"
    access_config {
      nat_ip = ""
      network_tier = "Premium"
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}