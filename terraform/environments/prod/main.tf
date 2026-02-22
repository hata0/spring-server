resource "google_service_account" "github_actions" {
  account_id = "${local.env}-${var.git-sa-id}"
}

resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
}

resource "google_artifact_registry_repository" "this" {
  format = "Docker"
  repository_id = "${local.env}-${var.gar_id}"
}

# resource "google_cloud_run_v2_service" "this" {
#   name = "${local.env}-${var.gcr_name}"
#   location = var.region
#
#   scaling {
#     min_instance_count = "0"
#     max_instance_count = "1"
#   }
#
#   template {
#     timeout = "1s"
#     max_instance_request_concurrency = "80"
#
#     containers {
#       image = var.gcr_image
#
#       resources {
#         cpu_idle = true
#         limits {
#           cpu = "1"
#           memory = "512Mi"
#         }
#       }
#
#       env = [
#         for k, v in var.gcr_env_vars : {
#           name  = k
#           value = v
#         }
#       ]
#     }
#   }
# }
