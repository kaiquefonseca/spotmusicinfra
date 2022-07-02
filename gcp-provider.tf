terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.26.0"
    }
  }
}

# Configura o Provider Google Cloud com o Projeto
provider "google" {
  project = "hackathon-7aso-grupo-01"
  region  = "us-central1"
  zone    = "us-central1-b"
}

provider "google-beta" {
  project = "hackathon-7aso-grupo-01"
  region  = "us-central1"
  zone    = "us-central1-b"
}