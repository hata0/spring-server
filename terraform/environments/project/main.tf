resource "google_project" "this" {
  name       = var.project_name
  project_id = var.project_id
  billing_account = var.billing_account
}

resource "google_project_service" "this" {
  for_each = local.services
  service = each.value
}
