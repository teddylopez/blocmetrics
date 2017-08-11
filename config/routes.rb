Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :registrations, only: [:create, :destroy, :show, :new]
  end

  get 'registrations/index'
  get "/users/:id/registrations/" => "registrations#new"
  root to: "registrations#index"

end
