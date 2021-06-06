# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/marketweb_mailer
# class for email preview
class MarketwebMailerPreview < ActionMailer::Preview
  def marketweb
    MarketwebMailer.with(user: 'user@example.com').marketweb
  end
end
