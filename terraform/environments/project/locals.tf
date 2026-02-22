locals {
  services = toset([
    "artifactregistry.googleapis.com",
    "run.googleapis.com"
  ])
}
