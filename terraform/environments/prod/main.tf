resource "google_service_account" "github_actions" {
  account_id = "${local.env}-${var.git_sa_id}"
}

resource "google_service_account_key" "github_actions" {
  service_account_id = google_service_account.github_actions.name
}

resource "google_project_iam_member" "github_actions" {
  for_each = local.git_sa_roles

  project = var.project_id
  role = each.value
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_artifact_registry_repository" "this" {
  format = "Docker"
  repository_id = "${local.env}-${var.gar_id}"
}

resource "google_cloud_run_v2_service" "this" {
  name = "${local.env}-${var.gcr_name}"
  location = var.region
  deletion_protection = false

  scaling {
    min_instance_count = "0"
    max_instance_count = "1"
  }

  template {
    timeout = "1s"
    max_instance_request_concurrency = "80"

    containers {
      image = var.gcr_image

      resources {
        cpu_idle = true
        startup_cpu_boost = true
        limits = {
          cpu = "1"
          memory = "512Mi"
        }
      }

      dynamic "env" {
        for_each = var.gcr_env_vars
        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "this" {
  name = google_cloud_run_v2_service.this.name
  role = "roles/run.invoker"
  member = "allUsers"
}
