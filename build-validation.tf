resource azuredevops_branch_policy_build_validation main {

  count = length(var.env_name)

  project_id = azuredevops_project.main.id

  enabled  = true
  blocking = true

  settings {
    display_name        = "${var.env_name[count.index]}-build-validation-policy"
    build_definition_id = azuredevops_build_definition.multi_stage[count.index].id
    valid_duration      = 420
    filename_patterns = [
      "/terraform/*"
    ]
    
    scope {
      match_type     = "DefaultBranch"
    }
  }
}