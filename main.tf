resource azuredevops_project main {
  name        = "automation"
  description = "This project is to be used to automate the automation. Most of the resources will be published using Terraform."
}

resource azuredevops_git_repository infra {
  project_id = azuredevops_project.main.id
  name       = "infrastructure"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/azdeivids/azdo-terraform-template-multi-stage.git"
  }
}