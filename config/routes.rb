Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root 'registered_apps#index', as: :authenticated_root
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  resources :registered_apps, only: [:create, :new, :show, :destroy]
  root to: 'registered_apps#about'

end
