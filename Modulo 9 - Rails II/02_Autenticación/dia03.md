# Desafío GUIADO

[x] Crear un modelo user con los campos name (string), email (string) y
password_digest (string)(0,5 Puntos)

[ ] Añadir el método has_secure_password al modelo User y agregar la gema bcrypt al Gemfile.

[ ] Añadir validación para que el campo email sea único.

[ ] Generar las rutas necesarias para crear usuarios.

[ ] Se recomienda no usar la herramienta scaffolding y hacer los métodos y vistas manualmente.

[ ]Revisar las rutas creadas y actualizar el link del navbar para que el perfil de usuario
apunte al show de users.

[ ]Crear controlador y formulario para un nuevo usuario. El formulario debe ser
generado utilizando el helper form_with añadiendo el modelo y debe implementar las
clases de bootstrap (revisar docs) (1 Punto).

[ ]El formulario debe tener el campo para name, email y password y
password_confirmation (0,5 Puntos).

[ ]Crear el método user_params para permitir solo los atributos name, email y
password (0,5 puntos).

[ ]En el controller users crear el método create. Este método debe generar una nueva
instancia de User recibiendo como argumento user_params y almacenarlo en la BD.
Luego, si el usuario es creado exitosamente, agregar @user.id a una variable de
session (session[:user_id]) y redireccionar al root_path, en caso de error, que haga
render del método new (1 Punto).

[ ]Añadir rutas de sesiones para crear y destruir sesión de usuario. Usar los helpers en
el navbar para iniciar y cerrar sesión (0,5 Puntos).

[ ]Crear el controlador de sesiones con los métodos new, create y destroy (1 Punto).

[ ]Crear los métodos current_user y logged? en ApplicationHelper. HINT (El método
logged? debe indicar si está presente la llave :user_id en el hash de sesión) (0,5
Puntos).

[ ]Completar los links del navbar para inicio de sesión y cerrar sesión (toggle entre
ambos según la evaluación del helper logged?) (1 Punto).

[ ]En caso de que no exista ningún usuario logueado mostrar en el navbar links para
registrarse e iniciar sesión (1 Punto).

[ ]El método destroy debe resetear las variables de sesión y redireccionar a la página
root (0,5 Puntos).

[ ]Añadir usuario actual a cada Story creada (Se requiere de migración para agregar la
referencia a la tabla Stories y ajustar las relaciones de los modelos) (1 Punto).

[ ]Crear vistas con las historias por usuario en el método show de user (1 Punto)
