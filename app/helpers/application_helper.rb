# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_ALERT_CLASSES = {
    success: 'alert-success',
    error: 'alert-danger',
    notice: 'alert-info',
    alert: 'alert-danger',
    warn: 'alert-warning'
  }.freeze
  def flash_classes(level)
    "alert #{BOOTSTRAP_ALERT_CLASSES[level.to_sym] || BOOTSTRAP_ALERT_CLASSES[:notice]}"
  end
end
