# frozen_string_literal: true

Rails.application.routes.draw do
  resources :text_inputs, only: [:create, :index, :show, :destroy] do
    post :visualization
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "text_inputs#index"
end
