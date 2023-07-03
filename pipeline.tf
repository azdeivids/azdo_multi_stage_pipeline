resource azuredevops_build_definition apply {

  count = length(var.env_name)

  project_id = azuredevops_project.main.id
  name       = "apply"
  path       = "\\${var.app_name}\\${var.env_name[count.index]}"

  ci_trigger {
    use_yaml = false
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.infra.id
    branch_name = azuredevops_git_repository.infra.default_branch
    yml_path    = ".azdo-pipelines/terraform-multi-stage.yaml"
  }

  variable_groups = [
    azuredevops_variable_group.azure_credentials[count.index].id,
    azuredevops_variable_group.azure_backend[count.index].id
  ]

  variable {
    name  = "ApplicationName"
    value = var.app_name
  }

  variable {
    name  = "EnvironmentName"
    value = var.env_name[count.index]
  }

  variable {
    name  = "WorkingDirectory"
    vlaue = "terraform"
  }
}