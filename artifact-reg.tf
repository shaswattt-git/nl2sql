resource "google_artifact_registry_repository" "ig-q-repo" {
  repository_id = var.artifact-reg-repo
  location      = var.region
  format        = "DOCKER"
  description   = "Docker repository for ig-q-repo"

  # Cleanup policy (dry run)
  lifecycle {
    prevent_destroy = true
  }
}
