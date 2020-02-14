provider "google" {
  version = "~> 3.8.0"
  project = "bencso-cloud-build-test"
  region  = "europe-west1"
  credentials = "account.json"
}

terraform {
  backend "gcs" {
    bucket = "cloud-build-demo-project-backend"
    prefix = "terraform/state"
    credentials = "account.json"
  }
}

resource "google_storage_bucket" "backend" {
  name = "cloud-build-demo-project-backend"
  location = "europe-west1"
  versioning {
    enabled = true
  }
}

resource "google_project_service" "services" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com"
  ])
  service = each.key
  disable_on_destroy = true
}