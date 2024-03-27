provider "google" {
  project         = var.project_id
  region = "eu-west2"
  zone = "eu-west2-a"
  credentials = var.service_account_key
}

