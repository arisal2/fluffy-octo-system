# frozen_string_literal: true

# Service to fetch API data
class ApiService
  API_MEDIC_SANDBOX_API_LOGIN = 'https://sandbox-authservice.priaid.ch/login'

  def initialize(params:)
    @params = params
  end

  def retrieve_data
    parsed_response
  end

  private

  attr_reader :params

  def select_api
    case params
    when 'all', 'countries', 'continents'
      call_api(ENV['DISEASES_API'] + params)
    when 'vaccine'
      call_api(ENV['VACCINATION_API'])
    when 'timeline'
      call_api(ENV['CORONA_TIMELINE_API'])
    else
      call_api(construct_url)
    end
  end

  def call_api(url)
    response = Faraday.get url

    response.body
  end

  def construct_url
    token = retrieve_token

    url = "#{ENV['API_MEDIC_SANDBOX_API_DIAGNOSIS']}?symptoms=[#{params[:symptoms]}]"
    url += "&gender=#{params[:gender]}"
    url += "&year_of_birth=#{params[:year]}&token=#{token}&format=json&language=en-gb"

    url
  end

  def retrieve_token
    token_response = Faraday.post API_MEDIC_SANDBOX_API_LOGIN do |req|
      req.headers['Authorization'] = ENV['AUTHORIZATION']
    end

    JSON.parse(token_response.body)['Token']
  end

  def parsed_response
    @parsed_response ||= JSON.parse(select_api)
  end
end
