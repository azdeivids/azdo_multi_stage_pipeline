variable app_name {
    type = string
}
variable env_name {
  type = list(string)
}
variable project_description {
  type = string
}
variable repo_template_url {
  type = string
}
variable reviewers {
  type = list(string)
}
variable minimum_number_of_reviewers {
  type = number
}
variable azure_credentials {
  type = map(
    object(
        {
            client_id       = string
            client_secret   = string
            tenant_id       = string
            subscription_id = string
        }
    )
  )
}
variable "azure_backend" {
  type = map(
    object(
        {
            resource_group  = string
            storage_account = string
            container       = string
        }
    )
  )
}