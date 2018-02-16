Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :registered_apps, only: [:create, :destroy, :show, :new]
  end

  get 'registered_apps/index'
  get "/users/:id/registered_apps/" => "registered_apps#new"
  root to: "registered_apps#index"

end
