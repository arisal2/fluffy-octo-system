# frozen_string_literal: true

# Controller to handle covid dashboard actions
class DashboardsController < ApplicationController
  def world_data
    @world_data = ReportService.process_table_data('countries')
    @general_data = ReportService.process_table_data('all')
  end

  def vaccination
    @vaccination_data = ReportService.process_table_data('vaccine')
  end

  def covid_chart
    @area_chart = ReportService.process_area_chart_data('timeline')
    @bar_chart = ReportService.process_bar_chart_data('continents')
  end

  def world_map
    @covid_cases_map_data = ReportService.process_covid_map_data('countries', 'cases')
    @covid_death_map_data = ReportService.process_covid_map_data('countries', 'deaths')
    p @covid_cases_map_data
  end
end
