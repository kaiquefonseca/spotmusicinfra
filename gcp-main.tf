resource "google_artifact_registry_repository" "repo-hackathon" {
  provider = google-beta

  location = "us-central1"
  repository_id = "labhackathon"
  description = "Imagens Docker"
  format = "DOCKER"
  }

resource "google_cloud_run_service" "spotfront" {
  name     = "cloudrun-spotfront"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/hackathon-7aso-grupo-01/labhackathon/spotfront"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "spotback" {
  name     = "cloudrun-spotback"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/hackathon-7aso-grupo-01/labhackathon/spotback"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}