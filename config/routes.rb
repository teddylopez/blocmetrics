Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root 'registered_apps#index', as: :authenticated_root
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  resources :contacts, only: [:new, :create]

  resources :registered_apps
  get 'welcome/landing'
  get 'welcome/info'

  root to: 'welcome#landing'

end
