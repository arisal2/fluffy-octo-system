# frozen_string_literal: true

# Mailer for Marketing the website
class MarketwebMailer < ApplicationMailer
  def marketweb
    @user = params[:user]
    mail(to: @user, subject: 'Get the latest COVID-19 information and diagnosis information for any symptoms!')
  end
end
