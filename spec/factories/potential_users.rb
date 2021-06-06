# frozen_string_literal: true

FactoryBot.define do
  factory :potential_user do
    name { 'Example' }
    email { 'example@gmail.com' }
  end
end
