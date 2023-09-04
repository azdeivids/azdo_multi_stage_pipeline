resource azuredevops_user_entitlement reviewers {

  count = length(var.reviewers)

  principal_name       = var.reviewers[count.index]
  account_license_type = "basic"
}

resource azuredevops_branch_policy_auto_reviewers main {
  project_id = azuredevops_project.main.id

  enabled  = true
  blocking = true

  settings {
    auto_reviewer_ids           = azuredevops_user_entitlement.reviewers.*.id
    minimum_number_of_reviewers = var.minimum_number_of_reviewers
    submitter_can_vote          = true
    message                     = "Required reviewer."

    scope {
      match_type     = "DefaultBranch"
    }
  }
}