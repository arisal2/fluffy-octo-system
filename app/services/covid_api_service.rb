# frozen_string_literal: true

# Service to fetch covid data
class CovidApiService
  def initialize(option:)
    @option = option
  end

  def retrieve_data
    select_api
  end

  private

  attr_reader :option

  def select_api
    return call_api(ENV['DISEASES_API'] + option) if option.eql?('all') || option.eql?('countries')
    return call_api(ENV['VACCINATION_API']) if option.eql?('vaccine')

    call_api(ENV['CORONA_TIMELINE_API'])
  end

  def call_api(url)
    response = RestClient::Request.execute(method: :get, url: url,
                                           timeout: 10)

    JSON.parse(response.body)
  end
end
