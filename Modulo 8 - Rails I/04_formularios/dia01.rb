# Formularios

# 1. Crear un nuevo proyecto que se llame registros
#? consola
# rails new registros
# cd registros
# rails s

# 2. Crear un controlador que se llame usuarios registro
#? consola
# rails g controller usuarios registro

# 3. Cambiar la ruta raiz hacia el controlador de usuarios y registros
# modificar el archivo config/routes.rb

root 'usuarios#registro'

# 4. Modificar la vista para generar un formulario con un text_field y un button

# <%= form_with do |f| %>
#   <%= f.text_field :correo %>
#   <%= f.submit "Registrar" %>
# <% end %>



# 5. Agregando la ruta para permitir el POST
# en config/routes.rb

post 'crear_usuario', to: 'usuarios#crear', as: 'usuario'

# 6. Agregar un mensaje por consola de los params

# app/controllers/usuarios_controller.rb
# POST /crear_usuario
def crear
  puts "DATOS".center(50, "*")
  puts params[:correo]
end

# 7. Asginar los siguientes datos para el usuario:
# Nombre      -> text_field
# Apellido    -> text_field
# Correo      -> email_field
# Contraseña  -> password_field
# Su color favorito -> color_field

# agregar en el archivo app/views/usuarios/registro.html.erb

<h1>Usuarios#registro</h1>

<%= form_with(url: 'crear_usuario') do |f| %>
  <div>
    <%= f.label :nombre %>
    <%= f.text_field :nombre %>
  </div>
  <div>
    <%= f.label :apellido %>
    <%= f.text_field :apellido %>
  </div>
  <div>
    <%= f.label :correo %>
    <%= f.email_field :correo %>
  </div>
  <div>
    <%= f.label :password %>
    <%= f.password_field :password %>
  </div>
  <div>
    <%= f.label :color_favorito %>
    <%= f.color_field :color_favorito %>
  </div>
  <%= f.submit "Registrar" %>
<% end %>

# 8. Modelos
# Representaciones de datos
# SINGULAR

#? consola
# rails g model Usuario nombre:string apellido:string correo:string password:string color_favorito:string
# rails db:migrate

#9. Guardar el registro del formulario en la tabla de usuarios

# actualizar el archivo app/controllers/usuarios_controller.rb
# POST /crear_usuario
def crear
  Usuario.create(
    #del modelo   | de la vista
    nombre:         params[:nombre],
    apellido:       params[:apellido],
    correo:         params[:correo],
    password:       params[:password],
    color_favorito: params[:color_favorito]
  )
end