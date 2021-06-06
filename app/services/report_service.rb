# frozen_string_literal: true

# Service to process reports
class ReportService
  class ReportServiceError < StandardError; end
  ERROR = 'symptoms are invalid or symptoms are in invalid format!'
  NO_DATA_ERROR = 'Data not available, please try again!'

  def self.process_table_data(params)
    result = ApiService.new(params: params).retrieve_data
    raise NO_DATA_ERROR if result.blank?

    result
  end

  # rubocop:disable Metrics/AbcSize)
  def self.process_area_chart_data(params)
    timeline_data = ApiService.new(params: params).retrieve_data
    raise NO_DATA_ERROR if timeline_data.blank?

    area_chart = { date: [], active: [], deaths: [], recovered: [] }
    timeline_data['data'].reverse_each do |timeline|
      area_chart[:date] << timeline['date']
      area_chart[:active] << timeline['active']
      area_chart[:deaths] << timeline['deaths']
      area_chart[:recovered] << timeline['recovered']
    end

    area_chart
  end
  # rubocop:enable Metrics/AbcSize)

  def self.process_bar_chart_data(params)
    continents_data = ApiService.new(params: params).retrieve_data
    raise NO_DATA_ERROR if continents_data.blank?

    continents_data.each_with_object({ continents: [], population: [], tests: [] }) do |continent, bar_chart|
      bar_chart[:continents] << continent['continent']
      bar_chart[:population] << continent['population']
      bar_chart[:tests] << continent['tests']
    end
  end

  def self.process_covid_map_data(params, flag)
    countries_data = ApiService.new(params: params).retrieve_data
    raise NO_DATA_ERROR if countries_data.blank?

    countries_data.each_with_object([]) do |country, map_data|
      next if country[flag].zero?

      map_data << { code3: country['countryInfo']['iso3'], name: country['country'], value: country[flag],
                    code: country['countryInfo']['iso2'] }
    end.to_json
  end

  def self.process_diagnosis_data(params)
    diagnosis_data = ApiService.new(params: params).retrieve_data
    return if diagnosis_data.eql? ERROR

    diagnosis_data
  end
end
