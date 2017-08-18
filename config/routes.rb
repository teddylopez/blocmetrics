Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root 'registrations#index', as: :authenticated_root
  end

  resources :registrations, only: [:create, :new, :show, :destroy]
  root to: 'registrations#about'

end
