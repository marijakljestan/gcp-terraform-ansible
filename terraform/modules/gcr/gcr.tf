resource "google_artifact_registry_repository" "docker-images" {
    project = "${var.project_id}"
    location = "${var.region}"
    repository_id = "${var.artifact_repository_id}"
    description = "docker images repository"
    format = "${var.artifact_repository_format}"
}