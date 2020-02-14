provider "google" {
  version = "~> 3.8.0"
  project = "primeval-sweep-260515"
  region  = "us-east1"
  zone    = ""
  credentials = "account.json"
}

terraform {
  backend "gcs" {
    bucket = "emarsys-cloud-build-demo-project-backend"
    prefix = "terraform/state"
    credentials = "account.json"
  }
}

resource "google_storage_bucket" "backend" {
  name = "emarsys-cloud-build-demo-project-backend"
  location = "us-east1"
  versioning {
    enabled = true
  }
}