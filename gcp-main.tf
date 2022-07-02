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
resource "google_sql_database" "spotmusicdb" {
  name     = "spotmusicdb"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "main" {
  name             = "spotmusic"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}