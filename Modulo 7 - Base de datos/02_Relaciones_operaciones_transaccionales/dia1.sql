/**
* ?                      🧤DÍA 01 - Relaciones y operaciones transacccionales🧤
* ?    SELECT columnas FROM tabla1 INNER JOIN       tabla2 ON tabla1.columna = tabla2.columna WHERE ...
* ?    SELECT columnas FROM tabla1 LEFT|RIGHT JOIN  tabla2 ON tabla1.columna = tabla2.columna WHERE ...
* ?    SELECT columnas FROM tabla1 FULL OUTER JOIN  tabla2 ON tabla1.columna = tabla2.columna WHERE ...
*/

/* 📒 BASE DE DATOS DE EMPRESA */
/* 
* 🗓 usuarios
*   |   rut     |   nombre  |   telefono    |   mail    |   genero  |   fecha_nacimiento    |
* 🗓 roles
*   |   id     |   nombre  |   descripcion    |
*/
/*❓ 1. Crear la base de datos empresa */
CREATE DATABASE empresa;
\c empresa
/*❓ 2. Crear las tablas solicitadas */
CREATE TABLE roles(
  id          SERIAL,
  nombre      VARCHAR,
  descripcion VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE usuarios(
    rut               VARCHAR,
    nombre            VARCHAR,
    telefono          INTEGER,
    mail              VARCHAR,
    genero            VARCHAR,
    fecha_nacimiento  DATE,
    rol_id            INTEGER,
    PRIMARY KEY(rut),
    FOREIGN KEY(rol_id) REFERENCES roles(id)
);
/*❓ 3. Insertar los datos solicitados */
INSERT INTO roles(nombre, descripcion)
VALUES
('administrador', 'control total'),           /* 1 */
('marketing',     'editar y crear anuncios'), /* 2 */
('editor',        'editar artículos'),        /* 3 */
('subscriptor',   'leer artículos')           /* 4 */
;

INSERT INTO usuarios (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES
('1-9', 'Juan Soto', 9999999, 'juan.soto@gmail.com', 'M', '2000-06-24', 1),
('2-7', 'Jorge Perez', 8888888, 'jorge.perez@hotmail.com', 'M', '1998-03-12', 4),
('3-5', 'Sara Morales', 7777777, 'sara.morales@gmail.com', 'F', '1990-02-11', null)
;
/*❓ 4. Realizar un INNER JOIN entre las tablar para analizar el resultado */
SELECT * FROM usuarios
INNER JOIN roles
ON usuarios.rol_id = roles.id;
/*❓ 5. Mostrar el rut, nombre, mail y nombre de rol de los usuarios que sean Admin */
SELECT usuarios.rut, usuarios.nombre, usuarios.mail, roles.nombre AS rol
FROM usuarios
INNER JOIN roles ON usuarios.rol_id = roles.id
WHERE roles.nombre = 'administrador';

SELECT usuarios.rut, usuarios.nombre, usuarios.mail, roles.nombre AS rol
FROM usuarios
INNER JOIN roles ON usuarios.rol_id = roles.id
WHERE usuarios.rol_id = 1;

/*❓ 6. Obtener todos los roles que NO tengan usuario utilizando un LEFT | RIGHT JOIN */
SELECT * FROM usuarios /* tabla de la izquierda */
LEFT JOIN roles ON usuarios.rol_id = roles.id;

SELECT * FROM roles /* tabla de la izquierda */
LEFT JOIN usuarios ON roles.id = usuarios.rol_id;

/*❓ 7. Obtener todos los roles que no tienen usuarios */
SELECT * FROM roles
LEFT JOIN usuarios ON roles.id = usuarios.rol_id
WHERE usuarios.rut IS NULL;

/*❓ 8. Consultar todas los registros de las dos tablas utilizando el FULL OUTER JOIN */
SELECT * FROM usuarios
FULL OUTER JOIN roles
ON usuarios.rol_id = roles.id;

/*❓ 9. FULL OUTER JOIN con un hueco en la mitad */
SELECT * FROM usuarios
FULL OUTER JOIN roles
ON usuarios.rol_id = roles.id
WHERE usuarios.rut is NULL OR roles.id IS NULL;

/* 📕 BASE DE DATOS DE POKEMON_ROJO */
/*❓ 1. Mostrar los nombres, tipo1 y estatura de los pokemones capturados */
SELECT * FROM capturados 
INNER JOIN pokemones 
ON capturados.pokedex = pokemones.pokedex;

SELECT pokemones.nombre, pokemones.tipo1, capturados.estatura FROM capturados
INNER JOIN pokemones
ON capturados.pokedex = pokemones.pokedex;

/*❓ 2. Utilizando el RIGHT | LEFT JOIN para conocer qué pokemones no hemos capturado todavía */
SELECT * FROM pokemones
LEFT JOIN capturados
ON pokemones.pokedex = capturados.pokedex
WHERE capturados IS NULL;

/*❓ 3. Obtener los nombres de los pokemons capturados 
que tienen un peso mayor a 200kilos */
SELECT  pokemones.nombre AS pokemones_pesados,
        capturados.peso
FROM capturados
INNER JOIN pokemones
ON capturados.pokedex = pokemones.pokedex
WHERE peso > 200;


/* 📗 BASE DE DATOS DE AUTOS */
/*❓ 1. Mostrar la marca de los autos que tengan registros de venta */
SELECT autos.marca, autos.modelo
FROM autos
INNER JOIN ventas
ON autos.id = ventas.id_auto;

/*❓ 2. Obtener los autos que no tengan ventas registradas */

SELECT autos.marca, autos.modelo, autos.año, autos.color, autos.precio
FROM autos
LEFT JOIN ventas
ON autos.id = ventas.id_auto
WHERE ventas.id IS NULL;