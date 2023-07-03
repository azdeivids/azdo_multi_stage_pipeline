resource azuredevops_environment main {
  count      = length(var.env)
  project_id = azuredevops_project.main.id
  name       = var.env[count.index]
}