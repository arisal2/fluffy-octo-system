# frozen_string_literal: true

# Migration to create potential users
class CreatePotentialUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
