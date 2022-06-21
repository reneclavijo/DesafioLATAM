# Indicaciones
# Historias de usuario

# ● Puedo como usuario normal, en la página principal (raíz), ver todos los posts ingresados 
# en orden descendiente (desde el último al primero), en cada post veo el título, la fecha 
# de ingreso, una imágen y el contenido. (2 Puntos)

# Funcionalidad -> Crear una página con root en la lista posts

# ● Dentro de la página veo un formulario para crear un post, el formulario me permite 
# ingresar el título, un link a una imágen y el contenido. Al llenar el formulario y 
# presionar en el botón submit el artículo debe ser subido y procesado en la acción 
# /posts/create, donde se mostrará una página de éxito o los errores según corresponda. 
# (3 Puntos)

# Funcionalidad -> Definir un fórmulario que me permita ingresar el título, el contenido
# el link a una imágen de internet y luego guardarlo en la BD. Si hay errores mostrarlos,
# sino pues mostrar una página de éxito

# ● Se debe validar la presencia del título (title), imagen (image_url) y 
# contenido (content). (1 Punto)

# Funcionalidad -> Validates en los modelos (utilizar el presence: true)

# ● El proyecto debe ser subido a heroku y se debe ingresar el link 
# para la evaluación. (2 Puntos)

# Funcionalidad -> Subir a Heroku
#! En heroku hay que ejecutar el heroku rake exec rails db:migrate

# ● Cada vez que se crea un post es necesario eliminar(censurar) una palabra del contenido. 
# Por ejemplo, si elegimos la palabra "spoiler", antes de guardar el post, 
# debemos eliminar esa palabra del contenido(content). (2 Puntos)
# Ej: content: "hay un spoiler increíble" => "hay un increíble".

#? Funcionalidad -> Utilizar el callback before_save

#  Convenciones para la evaluación
# ● El formulario debe tener id="create_posts".
# ● Puedes usar HTML para validar la presencia de atributos.
# ● Aún no vemos cómo subir contenido, así que la imagen de los posts serán referenciadas por una url.
# ● El modelo debe llamarse post y la tabla de la base de datos posts. (ESTO lo hace el RAILS)
# ○ El título debe llamarse title, el contenido content, la imagen image_url, en la fecha 
# se utilizará created_at (este último se crea por defecto al momento de crear el modelo).
# ● Se deben respetar las URLs especificadas para lograr la evaluación.
# ● Para realizar la evaluación se ingresarán 3 posts con contenido de prueba y se
# revisará la existencia de estos y el orden mostrado en la página principal.
#! ● Solo debe ser subido el link al sitio en producción para la evaluación.
# AGREGAR el link de heroku al README del proyecto


# PASOS PARA EL DESAFÍO

#* 1. Crear el proyecto de rails
#? consola
# rails new blog
# cd blog
# rails s
# (abrir otra consola)

#* 2. Crear un controlador llamado posts_controller
#? consola
# rails g controller posts index new

#* 3. Actualizar la ruta root con la vista de index de posts
# config/routes.rb

Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#* 4. Definir la vista de los posts
# app/views/posts/index.html.erb

# <div class="card-post">
#   <div class="card-image">
#     <img src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/01073865290819.5d61d475f0072.jpg" alt="">
#   </div>
#   <div class="card-date">20 de junio de 2022</div>
#   <div class="card-title">
#     <h2>Título del posts</h2>
#   </div>
#   <div class="card-content">
#     Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores eos illum repellat consectetur optio sit reprehenderit temporibus ea quasi ut amet odit iste obcaecati provident dolorem rem, nihil voluptate qui.
#   </div>
# </div>

# app/assets/stylesheets/application.css

# body {
#   background-color: #000;
#   color: #fff
# }

# .card-post{
#   max-width: 25%;
# }

# .card-image img{
#   width: 100%;
# }

# .card-date {
#   color: #444444;
# }

#* 5. Crear el modelo Post con title:string, content:string, image_url:string
#? consola
# rails g model Post title:string content:string image_url:string

#* 6. Ejecutar la migración
#? consola
# rails db:migrate

#* 7. Debemos crear 3 posts en la base de datos utilizando la consola
#! Ejecutar el comando para ingresar a la consola de rails
# rails c

post1 = Post.create(
  title: "Post1 - Prueba",
  content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex ratione sint, esse rerum tempore ut temporibus corporis ad, dolor cumque libero harum placeat debitis quisquam blanditiis velit molestiae modi. Illo?",
  image_url: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/01073865290819.5d61d475f0072.jpg"
)

post2 = Post.create(
  title: "Post2 - Desarrollo",
  content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate, tenetur expedita ipsum eveniet saepe quam. Nostrum sunt quidem qui velit, a assumenda cum ullam magnam saepe, ipsa porro. Sit, excepturi?",
  image_url: "https://wallpaperaccess.com/full/869.jpg"
)

post3 = Post.create(
  title: "Post3 - Producción",
  content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas ea repellat dolore quidem eligendi voluptatum veritatis, quasi sunt obcaecati beatae nisi non error, recusandae ipsum autem explicabo architecto. Obcaecati, ullam!",
  image_url: "https://graphicriver.img.customer.envatousercontent.com/files/287540824/snowy%20mountains%20_pv.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=fabde8884b9c477c687f24ee22ab8294"
)

#! Salir de la consola de rails
# ctrl + d
#! o escribir 
# exit

#* 8. Recuperar la lista de posts para mostrarlos en la vista principal

#* app/controllers/posts_controller.rb
def index
  @lista_posts = Post.all.order(created_at: :desc)
end

#* app/views/posts/index.html.erb
# <% @lista_posts.each do |p| %>
#   <div class="card-post">
#     <div class="card-image">
#       <%= image_tag p.image_url %>
#     </div>
#     <div class="card-date"> <%= p.created_at %> </div>
#     <div class="card-title">
#       <h2> <%= p.title %> </h2>
#     </div>
#     <div class="card-content">
#       <%= p.content %>
#     </div>
#   </div>
# <% end %>

#* 9. Definir el formulario para crear un nuevo post
# Agregar el código en app/views/posts/new.html.erb

# <h1>Crear un nuevo post</h1>

# <%= form_with() do |f| %>

#   <%= f.label :title %>
#   <%= f.text_field :title %>

#   <%= f.label :content %>
#   <%= f.text_field :content %>

#   <%= f.label :image_url %>
#   <%= f.text_field :image_url %>
  
#   <%= f.submit "Crear Post" %>

# <% end %>

#* 10. Definir la ruta para el post donde vamos a enviar el formulario y la lógica del controlador
# config/routes.rb
Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'
  post 'posts/create', to: 'posts#create', as: 'create_post'
end
# app/controllers/posts_controllers.rb
# Agregar archivo
def create
  @new_post = Post.new(
    title: params[:title],
    content: params[:content],
    image_url: params[:image_url]
  )
  if @new_post.save
    # verdadero
    # Redirigir a la lista de posts
    redirect_to action: :index
  else
    # falso
    # pedir prestada la vista del new (el formulario)
    render :new
  end
end

