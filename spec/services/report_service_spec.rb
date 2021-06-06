# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ReportService, type: :class do
  subject(:report_service) { described_class }
  let(:params) { 'example' }

  describe '::process_table_data' do
    context 'when api request is successful' do
      let(:response_table_data) do
        {
          "updated": 0,
          "cases": 0,
          "todayCases": 0,
          "deaths": 0
        }
      end

      context 'with table data' do
        before(:each) do
          expect_any_instance_of(ApiService).to receive(:retrieve_data).and_return(response_table_data)
        end

        it 'returns response' do
          expect(subject.process_table_data(:params)).to include(
            "updated": 0,
            "cases": 0,
            "todayCases": 0,
            "deaths": 0
          )
        end
      end
    end
  end

  describe '::process_diagnosis_data' do
    context 'when api request is successful' do
      let(:response_diagnosis_data) do
        {
          "Issue": {
            "ID": 281,
            "Name": 'Food poisoning',
            "Accuracy": 90,
            "Icd": 'A05;A02;A03;A04',
            "IcdName": 'Shigellosis;Other bacterial intestinal infections',
            "ProfName": 'Foodborne illness',
            "Ranking": 1
          },
          "Specialisation": [
            {
              "ID": 15,
              "Name": 'General practice',
              "SpecialistID": 0
            },
            {
              "ID": 19,
              "Name": 'Internal medicine',
              "SpecialistID": 0
            }
          ]
        }
      end

      context 'with diagnosis data' do
        before(:each) do
          expect_any_instance_of(ApiService).to receive(:retrieve_data).and_return(response_diagnosis_data)
        end

        it 'returns response' do
          expect(subject.process_diagnosis_data(:params)).to include(
            {
              "Issue": {
                "ID": 281,
                "Name": 'Food poisoning',
                "Accuracy": 90,
                "Icd": 'A05;A02;A03;A04',
                "IcdName": 'Shigellosis;Other bacterial intestinal infections',
                "ProfName": 'Foodborne illness',
                "Ranking": 1
              },
              "Specialisation": [
                {
                  "ID": 15,
                  "Name": 'General practice',
                  "SpecialistID": 0
                },
                {
                  "ID": 19,
                  "Name": 'Internal medicine',
                  "SpecialistID": 0
                }
              ]
            }
          )
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
