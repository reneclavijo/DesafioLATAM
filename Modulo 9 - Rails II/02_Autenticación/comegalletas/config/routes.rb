Rails.application.routes.draw do
  get 'perfiles/publico'
  get 'perfiles/privado'
  get 'frascos/ver'
  get 'frascos/asignar'
  get 'frascos/borrar'
  post 'perfiles/iniciar_sesion', to: 'perfiles#iniciar_sesion'
  delete 'perfiles/cerrar_sesion', to: 'perfiles#cerrar_sesion'
end
