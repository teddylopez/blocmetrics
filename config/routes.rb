Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :registrations, only: [:create, :new, :show, :destroy]
  end

  get 'registrations/index'
  get "/users/:id/registrations/" => "registrations#new"
  delete "/users/:id/registrations/:id", to: "registrations#delete", as: "delete_app"
  root to: "registrations#index"

end
