# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PotentialUser, type: :model do
  subject { described_class }

  describe '::import' do
    context 'file structure matches table schema' do
      it 'creates table rows with csv rows' do
        file = instance_double(File)
        csv_file = build_csv(described_class.column_names, 3)
        allow(file).to receive(:path)
        allow(File).to receive(:open).and_return(csv_file)
        expect { subject.import(file) }.to change { described_class.all.size }.by(3)
      end
    end
  end

  describe '::validate_email' do
    let!(:potential_user_valid) { FactoryBot.create(:potential_user) }
    let!(:potential_user_invalid) { FactoryBot.create(:potential_user, name: "Example 2", email: 'example2@example.com') }
    let!(:potential_user_regex) { FactoryBot.create(:potential_user, name: "Example 3", email: "example.example.com") }
    before { 
      create_configuration(verifier_email: 'email@gmail.com', verifier_domain: 'gmail.com') 
    }

    context 'potential use has valid email' do
      it 'collects validated email' do
        expect(subject.validate_email).to eq(['example@gmail.com'])
      end
    end
  end

  def build_csv(column_name_array, row_amount = 3)
    CSV.generate do |csv|
      csv << column_name_array
      (1..row_amount).each do |value|
        csv << CSV::Row.new(column_name_array, Array.new(column_name_array.size, value.to_s))
      end
    end
  end
end
