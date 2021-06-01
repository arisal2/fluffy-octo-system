# frozen_string_literal: true

# Helper for Dashboard
module DashboardsHelper
  def current_date
    @current_date ||= Time.at(strip_time).strftime('%d/%m/%Y')
  end

  def strip_time
    @strip_time ||= @general_data['updated'].to_s[0...-3].to_i
  end
end
