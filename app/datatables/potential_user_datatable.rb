# frozen_string_literal: true

# Class for Potetntial Users Datatable
class PotentialUserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'PotentialUser.id' },
      name: { source: 'PotentialUser.name' },
      email: { source: 'PotentialUser.email' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        email: record.email
      }
    end
  end

  # rubocop:disable Naming/AccessorMethodName
  def get_raw_records
    PotentialUser.all
  end
  # rubocop:enable Naming/AccessorMethodName
end
