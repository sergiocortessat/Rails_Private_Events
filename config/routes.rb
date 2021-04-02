Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root "events#index"
  resources :events, only: [:index, :show, :new, :create, :destroy] do 
    member do
      post "attend"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
