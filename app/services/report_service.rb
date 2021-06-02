# frozen_string_literal: true

# Service to process reports
class ReportService
  def self.process_table_data(option)
    api_service(option)
  end

  def self.process_area_chart_data
    timeline_data = api_service
    area_chart = { date: [], active: [], deaths: [], recovered: [] }

    timeline_data['data'].reverse_each do |timeline|
      area_chart[:date] << timeline['date']
      area_chart[:active] << timeline['active']
      area_chart[:deaths] << timeline['deaths']
      area_chart[:recovered] << timeline['recovered']
    end

    area_chart
  end

  def self.process_bar_chart_data(option)
    continents_data = api_service(option)
    bar_chart = { continents: [], population: [], tests: [] }

    continents_data.each do |continent|
      bar_chart[:continents] << continent['continent']
      bar_chart[:population] << continent['population']
      bar_chart[:tests] << continent['tests']
    end

    bar_chart
  end

  def self.process_covid_map_data(option, flag)
    countries_data = api_service(option)
    select_type = flag ? 'cases' : 'deaths'
    countries_data.each_with_object([]) do |country, map_data|
      next if country[select_type].zero?

      map_data << { code3: country['countryInfo']['iso3'], name: country['country'], value: country[select_type],
                    code: country['countryInfo']['iso2'] }
    end.to_json
  end

  def self.process_diagnosis_data(params)
    diagnosis_data = api_medic_service(params)
    return if diagnosis_data.eql?('symptoms are invalid or symptoms are in invalid format!')

    diagnosis_data
  end

  def self.api_service(option = nil)
    CovidApiService.new(option: option).retrieve_data
  end

  def self.api_medic_service(params)
    ApiMedicService.new(params: params).retrieve_diagnosis
  end
end
