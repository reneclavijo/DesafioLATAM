# Gema de Devise

Generar un proyecto que permita los usuarios cargar los libros que les guesten y dar una puntuación

## Pasos para instalar Devise

1. Generar el proyecto de rails

   ```bash
   rails new imdb_books
   cd imdb_books
   ```

2. Agregar la gema al Gemfile

   ```ruby
    gem 'devise'
   ```

   Ejecutar en consola `bundle install`

   Generar el archivo de configuración de Devise con el código

    ```bash
    rails g devise:install
    ```

3. Generar un controlador Welcome y su vista index para que sean la vista raiz

   ```bash
   rails g controller welcome index
   ```

   Configurar el archivo de rutas de la siguiente manera

  ```ruby
  # config/routes.rb
  root 'home#index'  
  ```

4. Agregar los mensajes *flash* el app/views/layouts/application.html.erb

    ```erb
    <body>
        <p class="notice"><%= notice %></p>
        <p class="alert"><%= alert %></p>
        <%= yield %>
    </body>
    ```

5. Generar el modelo User utilizando Devise

   ```bash
   rails g devise User name:string
   rails db:migrate
   rails s
   ```

## Genearrel scaffold de books para poder agregarle seguridad a esas vistas

1. Ejecutar el comando de scaffold en consola

   ```bash
   rails g scaffold Book title:string stars:integer author:string user:references
   rails db:migrate
   rails s
   ```

2. Agregar segurar al scaffold de books

3. Agregar bootstrap y el navbar
