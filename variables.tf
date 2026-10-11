variable "push_providers" {
  description = <<EOT
Map of push_providers, attributes below
Required:
    - name
    - provider_type
Optional:
    - configuration (block):
        - apns_configuration (optional, block):
            - file_name (optional)
            - key_id (optional)
            - team_id (optional)
            - token_signing_key (optional)
        - fcm_configuration (optional, block):
            - service_account_json (optional, block):
                - auth_provider_x509_cert_url (optional)
                - auth_uri (optional)
                - client_email (optional)
                - client_id (optional)
                - client_x509_cert_url (optional)
                - file_name (optional)
                - private_key (optional)
                - private_key_id (optional)
                - project_id (optional)
                - token_uri (optional)
                - type (optional)
EOT

  type = map(object({
    name          = string
    provider_type = string
    configuration = optional(list(object({
      apns_configuration = optional(list(object({
        file_name         = optional(string)
        key_id            = optional(string)
        team_id           = optional(string)
        token_signing_key = optional(string)
      })))
      fcm_configuration = optional(list(object({
        service_account_json = optional(list(object({
          auth_provider_x509_cert_url = optional(string)
          auth_uri                    = optional(string)
          client_email                = optional(string)
          client_id                   = optional(string)
          client_x509_cert_url        = optional(string)
          file_name                   = optional(string)
          private_key                 = optional(string)
          private_key_id              = optional(string)
          project_id                  = optional(string)
          token_uri                   = optional(string)
          type                        = optional(string)
        })))
      })))
    })))
  }))
}

