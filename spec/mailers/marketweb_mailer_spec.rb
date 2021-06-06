# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MarketwebMailer, type: :mailer do
  describe 'marketweb' do
    let(:mail) { MarketwebMailer.with(user: 'user@example.com').marketweb }

    it 'renders the headers' do
      expect(mail.subject).to eq('Get the latest COVID-19 information and diagnosis information for any symptoms!')
      expect(mail.from).to eq([ENV['TEST_EMAIL']])
      expect(mail.to).to eq(['user@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Greetings from FLUFFY OCTO SYSTEM')
    end
  end
end
