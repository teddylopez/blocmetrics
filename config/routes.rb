Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root 'registrations#index', as: :authenticated_root
  end

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end

  resources :registrations, only: [:create, :new, :show, :destroy]
  root to: 'registrations#about'

  match '/events', to: 'events#preflight', via: [:options]
  resources :events, only: [:create]

end
