Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  get 'home/index'
  
  root to: "home#index"

end
