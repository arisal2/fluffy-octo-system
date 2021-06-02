# frozen_string_literal: true

# Class for Symptom Datatable
class SymptomDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'Symptom.id' },
      symptom_id: { source: 'Symptom.symptom_id' },
      name: { source: 'Symptom.name', cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        symptom_id: record.symptom_id,
        name: record.name
      }
    end
  end

  # rubocop:disable Naming/AccessorMethodName
  def get_raw_records
    Symptom.all
  end
  # rubocop:enable Naming/AccessorMethodName
end
