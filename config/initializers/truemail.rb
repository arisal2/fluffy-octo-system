# frozen_string_literal: true

Truemail.configure do |config|
  config.verifier_email = ENV['SMTP_USER_NAME']
  # rubocop:disable Layout/LineLength
  config.email_pattern = /(?=\A.{6,255}\z)(\A([\p{L}0-9]+[\w|\-|.|+]*)@((?i-mx:[\p{L}0-9]+([\-.]{1}[\p{L}0-9]+)*\.\p{L}{2,63}))\z)/
  # rubocop:enable Layout/LineLength
  config.smtp_error_body_pattern = /(?=.*550)(?=.*(user|account|customer|mailbox)).*/i
  config.smtp_fail_fast = true
  config.smtp_safe_check = true
  config.logger = { tracking_event: :error, stdout: true, log_absolute_path: "#{Rails.root}/log/invalid_email.log" }
end
