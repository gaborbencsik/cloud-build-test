
resource "google_cloudbuild_trigger" "bencso-test-terraform" {
  description = "Build with terraform"
  
  trigger_template {
    branch_name = "master"
    repo_name   = "github_gaborbencsik_cloud-build-test"
  }

  build {
    step {
      name = "gcr.io/cloud-builders/npm"
      args = ["i"]
    }

    step {
      name = "gcr.io/cloud-builders/npm"
      args = ["t"]
    }
  }
}
