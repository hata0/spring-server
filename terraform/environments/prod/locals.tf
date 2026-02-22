locals {
  env = "prod"
  git_sa_roles = toset(["roles/artifactregistry.writer"])
}
