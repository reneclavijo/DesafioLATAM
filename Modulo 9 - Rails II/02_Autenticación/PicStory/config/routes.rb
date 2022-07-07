Rails.application.routes.draw do
 
  root 'stories#index'
  resources :stories
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
