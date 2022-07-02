Rails.application.routes.draw do
  
  resources :categories
  
  resources :movies do
    resources :reviews
  end
end
