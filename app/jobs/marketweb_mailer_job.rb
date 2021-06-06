# frozen-string_literal: true

# Class for Mailer Job
class MarketwebMailerJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    valid_emails = PotentialUser.validate_email
    valid_emails.each do |email|
    def someting
      MarketwebMailer.with(user: nil).marketweb.deliver_now
    rescue StandardError => e
      CustomLog.debug e.message.to_s
    end
  end
end
