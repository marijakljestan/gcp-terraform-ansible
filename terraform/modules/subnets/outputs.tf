output "out_image_builder_subnet" {
  value = google_compute_subnetwork.image-builder-subnet.self_link
}

output "out_mongodb_subnet" {
  value = google_compute_subnetwork.mongodb-subnet.self_link
}

output "out_mongo_express_subnet" {
  value = google_compute_subnetwork.mongo-express-subnet.self_link
}

output "out_server_app_subnet" {
  value = google_compute_subnetwork.server-app-subnet.self_link
}