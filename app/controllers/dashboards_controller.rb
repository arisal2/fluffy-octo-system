# frozen_string_literal: true

# Controller to handle covid dashboard actions
class DashboardsController < ApplicationController
  def world_data
    @world_data = countries_data
    @general_data = api_service('all')
  end

  def vaccination
    @vaccination_data = api_service('vaccine')
  end

  def covid_chart
    @charts_data = api_service('continents')
    @time_line_data = api_service
  end

  def world_map
    @world_maps = api_service('jhucsse')
    @world_data = countries_data
  end

  private

  def countries_data
    api_service('countries')
  end

  def api_service(option = nil)
    CovidApiService.new(option: option).retrieve_data
  end
end
