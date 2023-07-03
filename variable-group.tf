resource azuredevops_variable_group azure_credentials {

  count = length(var.env)

  project_id   = azuredevops_project.main.id
  name         = "azure-tf-credentials-${var.env[count.index]}."
  description  = "Azure credentials for ${var.env[count.index]} to authenticate terraform"
  allow_access = true

  variable {
    name  = "ARM_CLIENT_ID"
    value = var.azure_credentials[var.env[count.index]].client_id
  }

  variable {
    name         = "ARM_CLIENT_SECRET"
    secret_value = var.azure_credentials[var.env[count.index]].client_secret
    is_secret    = true
  }

  variable {
    name  = "ARM_TENANT_ID"
    value = var.azure_credentials[var.env[count.index]].tenant_id
  }

  variable {
    name  = "ARM_SUBSCRIPTION_ID"
    value = var.azure_credentials[var.env[count.index]].subscription_id
  }
}

resource azuredevops_variable_group azure_backend {
  
  count = length(var.end)

  project_id   = azuredevops_project.main.id
  name         = "azure-tf-backend-${var.env[count.index]}"
  description  = "Azure backend for ${var.env[count.index]} state file."
  allow_access = true

  variable {
    name  = "BACKEND_RESOURCE_GROUP_NAME"
    value = var.azure_backend[var.env[count.index]].resource_group
  }

  variable {
    name  = "BACKEND_STORAGE_ACCOUNT_NAME"
    value = var.azure_backend[var.env[count.index]].storage_account
  }

  variable {
    name  = "BACKEND_STORAGE_CONTAINER_NAME"
    value = var.azure_backend[var.env[count.index]].container
  }
}