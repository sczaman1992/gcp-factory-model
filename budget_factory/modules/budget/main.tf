
resource "google_billing_budget" "budget" {
  for_each        = var.budgets
  billing_account = var.billing_account
  display_name    = each.key
  budget_filter {
    projects               = ["projects/${var.service_project_number}"]
    credit_types_treatment = each.value.budget_filter.credit_types_treatment
    services               = each.value.budget_filter.services
    calendar_period        = each.value.budget_filter.calendar_period
    dynamic "custom_period" {
      for_each = each.value.budget_filter.calendar_period == null ? [each.value.budget_filter.custom_period] : []
      content {
        start_date {
          day   = custom_period.value.start_date.day
          month = custom_period.value.start_date.month
          year  = custom_period.value.start_date.year
        }
        end_date {
          day   = custom_period.value.end_date.day
          month = custom_period.value.end_date.month
          year  = custom_period.value.end_date.year
        }
      }
    }
  }
  amount {
    specified_amount {
      currency_code = each.value.amount.specified_amount.currency_code
      units         = tostring(each.value.amount.specified_amount.currency_amount)
    }
  }
  threshold_rules {
    threshold_percent = each.value.threshold_rules.alert_spent_percents
    spend_basis       = each.value.threshold_rules.alert_spend_basis
  }
  all_updates_rule {
    pubsub_topic                     = each.value.all_updates_rule.alert_pubsub_topic
    monitoring_notification_channels = try(var.notification_channels, each.value.all_updates_rule.monitoring_notification_channels)
  }
}



