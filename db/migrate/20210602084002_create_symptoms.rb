# frozen_string_literal: true

# Migartion to create symptom table
class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.string :symptom_id
      t.string :name

      t.timestamps
    end
  end
end
