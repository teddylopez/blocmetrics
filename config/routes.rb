Rails.application.routes.draw do

  devise_for :users
  resources :registrations, only: [:create, :new, :show, :destroy]

  root to: 'registrations#new'

end
