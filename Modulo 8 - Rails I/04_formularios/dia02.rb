
# 1. Crear la vista lista para el controlador de usuarios
# Crear un archivo en
# app/views/usuarios/listar.html.erb
# y agregar el siguiente código

# <h1>Lista de usuarios registrados</h1>

# 2. Definido el método en el controlador y la ruta que permita el acceso
# Agregar el def en app/controllers/usuarios_controller.rb
# GET 
def listar

end

# agregar la ruta para la vista
get 'listar_usuarios', to: 'usuarios#listar', as: 'usuarios'

# 3. Mostrar la lista de los usuarios registrados en la nueva vista

# Agregar el siguiente código en el método listar
# en app/controllers/usuarios_controller.rb
  # GET 
  def listar
    @lista_de_usuarios = Usuario.all
  end

# Agregar el código para mostrar la lista de usuarios
# utilizando .each

# app/views/usuarios/listar.html.erb
# <% @lista_de_usuarios.each do |u| %>
#   <div class="tarjeta-usuario">
#     <p> <%= u.nombre %> </p>
#     <p> <%= u.apellido %> </p>
#     <p> <%= u.correo %> </p>
#     <p> <%= u.password %> </p>
#     <p> <%= u.color_favorito %> </p>
#   </div>
# <% end %>

# 4. Formulario de búsqueda
# Agregar en la vista app/views/usuarios/listar.html.erb
form_with(url: '/url-de-la-ruta', method: :get) do |form|
end

# 5. Definir una ruta y lógica para responder la petición
# Agregar al archivo app/views/usuarios/listar.html.erb
# <%= form_with(url: '/listar_usuarios', method: :get) do |f| %>
#   <%= f.text_field :buscar %>
#   <%= f.submi "Buscar %>
# <% end %>

# 6. Recuperar los parámetros enviados hacia el controlador
# Agregar al archivo app/controllers/usuarios_controller.rb
  # GET /listar_usuarios
  def listar
    if params[:busqueda] && !params[:busqueda].empty?
      @lista_de_usuarios = Usuario.where(nombre: params[:busqueda])
    else
      @lista_de_usuarios = Usuario.all
    end
  end

#? Excluviamente algo propio de los modelos
#! Validadores
# 1. Evitar que se almacenen campos vacíos
# agregar validadores al modelo app/models/usuario.rb
class Usuario < ApplicationRecord
  validates :nombre,          presence: true
  validates :apellido,        presence: true
  validates :correo,          presence: true
  validates :password,        presence: true
  validates :color_favorito,  presence: true
end

# modificando el controlador para controlar el flujo del guardado
  # POST /crear_usuario
  def crear
    # Modelo
@usuario_nuevo = Usuario.new(
#del modelo   | de la vista
nombre:         params[:nombre],
apellido:       params[:apellido],
correo:         params[:correo],
password:       params[:password],
color_favorito: params[:color_favorito]
)
if @usuario_nuevo.save
# redirect_to usuarios_path # apunta al alias (as:)
redirect_to action: :listar  # apunta al controlador usuarios y su método listar
else
# flash es un Hash para enviarse mensaje entre controladores y vistas
flash[:error] = "Error al guardar al usuario"
# toma prestada la vista registro
render :registro
end 
end

# Mostrar un mensaje de flash en la vista con el error
# <% if flash[:error] %>
#   <span style="color:red;">
#     <%= flash[:error] %>
#   </span>
# <% end %>

#! Callbacks
# 1. Simular el envído de un correo electrónico
# al usuario que acaba de registrarse

class Usuario < ApplicationRecord
  # callback es a un método propio
  after_save :enviar_correo

  validates :nombre,          presence: true
  validates :apellido,        presence: true
  validates :correo,          presence: true
  validates :password,        presence: true
  validates :color_favorito,  presence: true
  
  # visibilidad
  private # de aquí para abajo, todo es de uso interno de Usuario
  def enviar_correo
    puts "ENVIANDO CORREO DE BIENVENIDA "
    puts "Registro completo de #{self.nombre}"
  end
end
