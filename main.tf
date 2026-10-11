resource "confluent_flink_compute_pool" "flink_compute_pools" {
  for_each = var.flink_compute_pools

  cloud        = each.value.cloud
  display_name = each.value.display_name
  region       = each.value.region
  default_pool = each.value.default_pool
  max_cfu      = each.value.max_cfu

  environment {
    id = each.value.environment.id
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

