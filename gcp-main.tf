resource "google_artifact_registry_repository" "repo-hackathon" {
  provider = google-beta

  location = "us-central1"
  repository_id = "labhackathon"
  description = "Imagens Docker"
  format = "DOCKER"