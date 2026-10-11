resource "okta_push_provider" "push_providers" {
  for_each = var.push_providers

  name          = each.value.name
  provider_type = each.value.provider_type

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      dynamic "apns_configuration" {
        for_each = configuration.value.apns_configuration != null ? configuration.value.apns_configuration : []
        content {
          file_name         = apns_configuration.value.file_name
          key_id            = apns_configuration.value.key_id
          team_id           = apns_configuration.value.team_id
          token_signing_key = apns_configuration.value.token_signing_key
        }
      }
      dynamic "fcm_configuration" {
        for_each = configuration.value.fcm_configuration != null ? configuration.value.fcm_configuration : []
        content {
          dynamic "service_account_json" {
            for_each = fcm_configuration.value.service_account_json != null ? fcm_configuration.value.service_account_json : []
            content {
              auth_provider_x509_cert_url = service_account_json.value.auth_provider_x509_cert_url
              auth_uri                    = service_account_json.value.auth_uri
              client_email                = service_account_json.value.client_email
              client_id                   = service_account_json.value.client_id
              client_x509_cert_url        = service_account_json.value.client_x509_cert_url
              file_name                   = service_account_json.value.file_name
              private_key                 = service_account_json.value.private_key
              private_key_id              = service_account_json.value.private_key_id
              project_id                  = service_account_json.value.project_id
              token_uri                   = service_account_json.value.token_uri
              type                        = service_account_json.value.type
            }
          }
        }
      }
    }
  }
}

