# Cookies

Están en el navegador

```bash
rails new comegalletas
cd comegalletas
rails g controller frascos ver asignar borrar
```

La documentación oficial para manejo de cookies en rails está en [página oficial de cookies](https://api.rubyonrails.org/classes/ActionDispatch/Cookies.html)

Controlador

Vista

Agregar la gema bcrypt en el Gemfile

```ruby
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
```

Ejecutar el bundle

```bash
bundle
```

Generar un modelo llamado Usuario con correo y password. Para utilizar la gema bcrypt, el campo que va a almcenar el texto cifrado debe terinar en **_digest**

```bash
rails g model Usuario correo:string password_digest:string
rails db:migrate
rails g controller perfiles publico privado
```

Agregar has_secure_ al modelo que tiene el campo con _digest

```ruby
class Usuario < ApplicationRecord
    has_secure_password
end
```

Ingresar a la consola de rails y crear 1 usuario con contraseña cifrada

```bash
rails c
nuevo_usuario = Usuario.create(correo: 'rene.clavijo@outlook.com', password: 'qwerty')
# mostrar la contraseña
nuevo_usuario.password
# para iniciar sesión utilizando el método .authenticate
nuevo_usuario.authenticate("123456")
# false
nuevo_usuario.authenticate("qwerty")
# Devuelve el usuario completo
exitra
rails s
```
