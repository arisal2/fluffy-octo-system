# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  resources :dashboards, only: [] do
    collection do
      get :world_data
      get :world_map
      get :vaccination
      get :covid_chart
    end
  end

  resources :symptoms, only: [:index]do
    collection do
      get :diagnosis
    end
  end

  root to: 'home#index'
end
