Rails.application.routes.draw do

  # nombre_controlador#vista
  root 'usuarios#registro'
  # para enviar y crear datos se utiliza el POST
  # NO tienen una vista, más lógicos
  # AcciónHTTP 'ruta/', to: quien se va a hacer cargo, as: alias
  post 'crear_usuario', to: 'usuarios#crear', as: 'usuario_nuevo'
  get 'listar_usuarios', to: 'usuarios#listar', as: 'usuarios'
end
