Rails.application.routes.draw do
  root 'home#index'  
  devise_for :usuarios
  devise_for :administradores
  resources :productos
  resources :categorias

  resources :carros, only: [] do
    get     :show, on: :collection
    put     :update, on: :collection
    patch   :update, on: :collection
    post  :pagar_con_paypal, on: :collection
    get   :procesar_pago_paypal, on: :collection    
    get   :transaccion_efectiva_transbank, on: :collection
    post  :transaccion_efectiva_transbank, on: :collection
  end
end
