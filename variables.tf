variable app_name {
    type = string
}
variable env {
  type = list(string)
}
variable repo_template {
  type = string
}
variable azure_credentials {
  type = map(
    object(
        {
            client_id       = string
            client_secret   = string
            client_id       = string
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