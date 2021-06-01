# frozen_string_literal: true

# Helper for Dashboard
module DashboardsHelper
  def latest_update
    Time.at(strip_latest_update_time).strftime('%d/%m/%Y')
  end

  def strip_latest_update_time
    @general_data['updated'].to_s[0...-3].to_i
  end

  def world_data_top_section(value)
    number_with_delimiter(@general_data[value], delimiter: ',')
  end

  def vaccination_top_section(value)
    number_with_delimiter(@vaccination_data['OWID_WRL'][value], delimiter: ',')
  end

  def area_chart_data(value)
    @area_chart[value]
  end

  def bar_chart_data(value)
    @bar_chart[value]
  end
end
