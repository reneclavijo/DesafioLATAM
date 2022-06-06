/* 1. */
CREATE DATABASE Posts;
\c posts

/* 2. */
CREATE TABLE post (
    id                  integer,
    nombre_de_usuario   varchar,
    fecha_de_creacion   date,
    contenido           varchar,
    descripcion         varchar
);

/* 3. */
INSERT INTO post(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES  
    (1, 'Pamela', '2022/05/19', 'Vamos a hacer el Quiz', 'Detalladamente vamos a realizar el quiz entre todos'),
    (2, 'Pamela', '2022/05/18', 'Permidos todo', 'Cuando no hacer un DROP TABLE sin WHERE'),
    (3, 'Pamela', '2022/05/15', 'Entrega de pruebas', 'El grupo que no entregó nada y pasó'),
    (4, 'Carlos', '2022/05/19', 'Ruby on Rails con BD', 'Haciendo el sql SIN sql')
;

/* 4. */
ALTER TABLE post ADD titulo varchar;

