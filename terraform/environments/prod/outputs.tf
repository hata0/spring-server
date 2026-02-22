output "github_actions_sa_key" {
  value     = base64decode(google_service_account_key.github_actions.private_key)
  sensitive = true
}
