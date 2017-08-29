Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root 'registered_applications#index', as: :authenticated_root
  end

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end

  resources :registered_applications, only: [:create, :new, :show, :destroy]
  root to: 'registered_applications#about'

  match '/events', to: 'events#preflight', via: [:options]
  resources :events, only: [:create]

end
