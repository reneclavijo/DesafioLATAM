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


