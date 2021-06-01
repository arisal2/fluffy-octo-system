# frozen_string_literal: true

# Helper for Dashboard
module DashboardsHelper
  def latest_update
    @latest_update ||= Time.at(strip_latest_update_time).strftime('%d/%m/%Y')
  end

  def strip_latest_update_time
    @strip_latest_update_time ||= @general_data['updated'].to_s[0...-3].to_i
  end

  def currently_active
    number_with_delimiter(@general_data['active'], delimiter: ',')
  end

  def total_confirmed
    number_with_delimiter(@general_data['cases'], delimiter: ',')
  end

  def total_recovered
    number_with_delimiter(@general_data['recovered'], delimiter: ',')
  end

  def total_deaths
    number_with_delimiter(@general_data['deaths'], delimiter: ',')
  end

  def total_vaccinations
    number_with_delimiter(@vaccination_data['OWID_WRL']['total_vaccinations'], delimiter: ',')
  end

  def total_population
    number_with_delimiter(@vaccination_data['OWID_WRL']['population'], delimiter: ',')
  end
end
