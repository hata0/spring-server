locals {
  env = "prod"
  enable_cloud_run = var.gcr_image != ""
  git_sa_roles = toset(["roles/artifactregistry.writer"])
}
