locals {
  monitoring_alert_map = {
    for f in fileset("${local.monitoring_alert_dir}", "**/*.json") :
    jsondecode(file("${local.monitoring_alert_dir}/${f}"))["displayName"] => jsondecode(file("${local.monitoring_alert_dir}/${f}"))
  }
  monitoring_alert_dir = var.monitoring_alert_config_dir
}

resource "google_monitoring_alert_policy" "monitoring_alert_factory" {
  for_each     = local.monitoring_alert_map
  project      = var.project_id
  display_name = each.value.displayName
  combiner     = try(each.value.combiner, "")
  dynamic "alert_strategy" {
    for_each = try(can(each.value.alertStrategy) ? [each.value.alertStrategy] : [], [])
    content {
      auto_close = try(alert_strategy.value.autoClose, "")
      dynamic "notification_rate_limit" {
        for_each = try(can(alert_strategy.value.notificationRateLimit) ? [alert_strategy.value.notificationRateLimit] : [], [])
        content {
          period = try(notification_rate_limit.value.period, "")
        }
      }
      dynamic "notification_channel_strategy" {
        for_each = try(alert_strategy.value.notificationChannelStrategy, [])
        content {
          notification_channel_names = try(notification_channel_strategy.value.notificationChannelNames, [])
          renotify_interval          = try(notification_channel_strategy.value.renotifyInterval, "")
        }
      }
    }
  }
  user_labels           = try(each.value.userLabels, [])
  enabled               = try(each.value.enabled, null)
  notification_channels = try(each.value.notificationChannels, [])
  dynamic "documentation" {
    for_each = try(can(each.value.documentation) ? [each.value.documentation] : [], [])
    content {
      content   = try(documentation.value.content, "")
      mime_type = try(documentation.value.mimeType, "")
    }
  }

  dynamic "conditions" {
    for_each = try(each.value.conditions, [])
    content {
      display_name = try(conditions.value.displayName, "")
      dynamic "condition_threshold" {
        for_each = try(can(conditions.value.conditionThreshold) ? [conditions.value.conditionThreshold] : [], [])
        content {
          filter     = try(condition_threshold.value.filter, "")
          duration   = try(condition_threshold.value.duration, "")
          comparison = try(condition_threshold.value.comparison, "")
          dynamic "aggregations" {
            for_each = try(condition_threshold.value.aggregations, [])
            content {
              alignment_period     = try(aggregations.value.alignmentPeriod, "")
              cross_series_reducer = try(aggregations.value.crossSeriesReducer, "")
              per_series_aligner   = try(aggregations.value.perSeriesAligner, "")
              group_by_fields      = try(aggregations.value.groupByFields, [])
            }
          }
          denominator_filter = try(conditions.value.conditionThreshold.denominatorFilter, "")
          dynamic "denominator_aggregations" {
            for_each = try(condition_threshold.value.denominatorAggregations, [])
            content {
              alignment_period     = try(denominator_aggregations.value.alignmentPeriod, "")
              cross_series_reducer = try(denominator_aggregations.value.crossSeriesReducer, "")
              per_series_aligner   = try(denominator_aggregations.value.perSeriesAligner, "")
              group_by_fields      = try(denominator_aggregations.value.groupByFields, "")
            }
          }
          threshold_value = try(conditions.value.conditionThreshold.thresholdValue, null)
          dynamic "trigger" {
            for_each = try(can(condition_threshold.value.trigger) ? toset([condition_threshold.value.trigger]) : [], [])
            content {
              percent = try(trigger.value.percent, null)
              count   = try(trigger.value.count, null)
            }
          }
          dynamic "forecast_options" {
            for_each = try(can(condition_threshold.value.forecastOptions) ? toset([condition_threshold.value.forecastOptions]) : [], [])
            content {
              forecast_horizon = try(forecast_options.value.forecastHorizon, "")
            }
          }
          evaluation_missing_data = try(conditions.value.conditionThreshold.evaluationMissingData, "")
        }
      }
      dynamic "condition_absent" {
        for_each = try(can(conditions.value.conditionAbsent) ? [conditions.value.conditionAbsent] : [], [])
        content {
          filter   = try(condition_absent.value.filter, "")
          duration = try(condition_absent.value.duration, "")
          dynamic "aggregations" {
            for_each = try(condition_absent.value.aggregations, [])
            content {
              alignment_period     = try(aggregations.value.alignmentPeriod, "")
              cross_series_reducer = try(aggregations.value.crossSeriesReducer, "")
              per_series_aligner   = try(aggregations.value.perSeriesAligner, "")
              group_by_fields      = try(aggregations.value.groupByFields, [])
            }
          }
          dynamic "trigger" {
            for_each = try(can(condition_absent.value.trigger) ? toset([condition_absent.value.trigger]) : [], [])
            content {
              percent = try(trigger.value.percent, null)
              count   = try(trigger.value.count, null)
            }
          }
        }
      }
      dynamic "condition_monitoring_query_language" {
        for_each = try(can(conditions.value.conditionMonitoringQueryLanguage) ? [conditions.value.conditionMonitoringQueryLanguage] : [], [])
        content {
          query    = try(condition_monitoring_query_language.value.query, "")
          duration = try(condition_monitoring_query_language.value.duration, "")
          dynamic "trigger" {
            for_each = try(can(condition_monitoring_query_language.value.trigger) ? toset([condition_monitoring_query_language.value.trigger]) : [], [])
            content {
              percent = try(trigger.value.percent, null)
              count   = try(trigger.value.count, null)
            }
          }
          evaluation_missing_data = try(conditions.value.conditionThreshold.evaluationMissingData, "")
        }
      }
      dynamic "condition_matched_log" {
        for_each = try(can(conditions.value.conditionMatchedLog) ? [conditions.value.conditionMatchedLog] : [], [])
        content {
          filter           = try(condition_matched_log.value.filter, "")
          label_extractors = try(condition_matched_log.value.labelExtractors, {})
        }
      }
    }
  }
}
