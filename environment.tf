resource azuredevops_environment main {
  count      = length(var.env_name)
  project_id = azuredevops_project.main.id
  name       = "${var.app_name}-${var.env_name[count.index]}"
}