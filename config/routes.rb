# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show]
  root 'events#index'
  resources :events, only: %i[index show new create destroy] do
    member do
      post 'attend'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
