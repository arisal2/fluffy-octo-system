# frozen_string_literal: true

# Class for Applcation Mailer
class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USER_NAME']
  layout 'mailer'
end
