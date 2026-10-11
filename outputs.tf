output "push_providers_id" {
  description = "Map of id values across all push_providers, keyed the same as var.push_providers except keys with no id are omitted"
  value       = { for k, v in okta_push_provider.push_providers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "push_providers_configuration" {
  description = "Map of configuration values across all push_providers, keyed the same as var.push_providers except keys with no configuration are omitted"
  value       = { for k, v in okta_push_provider.push_providers : k => v.configuration if v.configuration != null && length(v.configuration) > 0 }
  sensitive   = true
}
output "push_providers_last_updated_date" {
  description = "Map of last_updated_date values across all push_providers, keyed the same as var.push_providers except keys with no last_updated_date are omitted"
  value       = { for k, v in okta_push_provider.push_providers : k => v.last_updated_date if v.last_updated_date != null && length(v.last_updated_date) > 0 }
}
output "push_providers_name" {
  description = "Map of name values across all push_providers, keyed the same as var.push_providers except keys with no name are omitted"
  value       = { for k, v in okta_push_provider.push_providers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "push_providers_provider_type" {
  description = "Map of provider_type values across all push_providers, keyed the same as var.push_providers except keys with no provider_type are omitted"
  value       = { for k, v in okta_push_provider.push_providers : k => v.provider_type if v.provider_type != null && length(v.provider_type) > 0 }
}

