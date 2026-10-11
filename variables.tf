variable "flink_compute_pools" {
  description = <<EOT
Map of flink_compute_pools, attributes below
Required:
    - cloud
    - display_name
    - region
    - environment (block):
        - id (required)
Optional:
    - default_pool
    - max_cfu
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    cloud        = string
    display_name = string
    region       = string
    default_pool = optional(bool)
    max_cfu      = optional(number)
    environment = object({
      id = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

