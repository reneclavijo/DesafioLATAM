# Desafío GUIADO

- [x] Crear un modelo user con los campos name (string),email(string) y password_digest (string)(0,5 Puntos)

    ```bash
    rails new PicStory
    cd PicStory
    rails g model User name:string email:string password_digest:string
    rails g scaffol Story title:string picture:string content:text user:references
    rails db:migrate
    ```

- [x] Añadir el método has_secure_password al modelo User y agregar la gema bcrypt al Gemfile.

    Quitar los comentarios del Gemfile para la gema Bcrypt

    ```ruby
    # Use Active Model has_secure_password
    gem 'bcrypt', '~> 3.1.7'
    ```

    Y ahora ejecutamos un `bundle` en consola y agregamos *has_secure_password* en app/models/user.rb

    ```ruby
    class User < ApplicationRecord
        has_secure_password
    end
    ```

- [x] Añadir validación para que el campo email sea único.

    ```ruby
    class User < ApplicationRecord
        has_secure_password

        validates :email, uniqueness: true
    end
    ```

- [x] Generar las rutas necesarias para crear usuarios.

    ```ruby
    Rails.application.routes.draw do
        root 'stories#index'
        resources :stories
        resources :users, only: [:new, :create, :show]
    end
    ```

**Se recomienda no usar la herramienta scaffolding y hacer los métodos y vistas manualmente.**

- [x] Revisar las rutas creadas y actualizar el link del navbar para que el perfil de usuario apunte al show de users.

- [x] Crear controlador y formulario para un nuevo usuario. El formulario debe ser generado utilizando el helper form_with añadiendo el modelo y debe implementar las clases de bootstrap (revisar docs) (1 Punto).

    Generar un nuevo controlador para usuarios con la vista del formulario (new) y la vista del perfil (show)

    `rails g controller users new show`

- [x] El formulario debe tener el campo para name, email y password y
password_confirmation (0,5 Puntos).

- [x] Crear el método user_params para permitir solo los atributos name, email y
password (0,5 puntos).

- [x] En el controller users crear el método create. Este método debe generar una nueva
instancia de User recibiendo como argumento user_params y almacenarlo en la BD.
Luego, si el usuario es creado exitosamente, agregar @user.id a una variable de
session (session[:user_id]) y redireccionar al root_path, en caso de error, que haga
render del método new (1 Punto).

- [x] Añadir rutas de sesiones para crear y destruir sesión de usuario. Usar los helpers en
el navbar para iniciar y cerrar sesión (0,5 Puntos).

- [x] Crear el controlador de sesiones con los métodos new, create y destroy (1 Punto).

    `rails g controller sessions new`

- [x] Crear los métodos current_user y logged? en ApplicationHelper. HINT (El método logged? debe indicar si está presente la llave :user_id en el hash de sesión) (0,5 Puntos).

- [x] Completar los links del navbar para inicio de sesión y cerrar sesión (toggle entre ambos según la evaluación del helper logged?) (1 Punto).

- [x] En caso de que no exista ningún usuario logueado mostrar en el navbar links para
registrarse e iniciar sesión (1 Punto).

- [x] El método destroy debe resetear las variables de sesión y redireccionar a la página
root (0,5 Puntos).

- [x] Añadir usuario actual a cada Story creada (Se requiere de migración para agregar la referencia a la tabla Stories y ajustar las relaciones de los modelos) (1 Punto).

    ```ruby
    # app/models/story.rb
    class Story < ApplicationRecord
    belongs_to :user
    end

    ```

    ```ruby
    # app/models/user.rb
    class User < ApplicationRecord
        has_secure_password
        has_many :stories
        
        validates :email, uniqueness: true
    end

    ```

- [ ] Crear vistas con las historias por usuario en el método show de user (1 Punto)
