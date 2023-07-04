resource azuredevops_project main {
  name        = var.app_name
  description = var.project_description
}

resource azuredevops_git_repository infra {
  project_id = azuredevops_project.main.id
  name       = "infrastructure"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = var.repo_template_url
  }
}