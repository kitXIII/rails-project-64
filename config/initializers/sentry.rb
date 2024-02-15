# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://3bb91135f027a252d9a933ff798d2563@o4506752648806400.ingest.sentry.io/4506752653328384'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
end
