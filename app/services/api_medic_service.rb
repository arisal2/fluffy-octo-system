# frozen_string_literal: true

# Service to fetch covid data
class ApiMedicService
  def initialize(params:)
    @params = params
  end

  def retrieve_diagnosis
    parsed_response
  end

  private

  attr_reader :params

  def retrieve_token
    token_response = Faraday.post('https://sandbox-authservice.priaid.ch/login') do |req|
      # The credential is for sandbox mode only, hence it is directly assgined.
      req.headers['Authorization'] = 'Bearer abhinavrisal99@gmail.com:O4yqq9B3HNogvNWL64qjPA=='
    end

    JSON.parse(token_response.body)['Token']
  end

  def call_api
    p construct_url
    response = Faraday.get construct_url

    response.body
  end

  def construct_url
    token = retrieve_token

    url = "#{ENV['API_MEDIC_SANDBOX_API_DIAGNOSIS']}?symptoms=[#{params[:symptoms]}]"
    url += "&gender=#{params[:gender]}"
    url += "&year_of_birth=#{params[:year]}&token=#{token}&format=json&language=en-gb"

    url
  end

  def parsed_response
    @parsed_response ||= JSON.parse(call_api)
  end
end
