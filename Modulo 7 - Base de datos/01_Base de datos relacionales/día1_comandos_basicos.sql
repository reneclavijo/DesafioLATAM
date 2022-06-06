/*=================================================*/
/*  OPERACIONES COMUNES EN CONSOLA PSQL  */
\c nombre_bd    /* conectarse a una base de datos específica */
\l              /* listar todas las bases de datos existentes */
\du             /* listar todos los usuarios en el gestor */
\d              /* listar todas las relaciones (o tablas) existentes en una base de datos específica  */
\dt             /* lista todas las tablas de una base de datos */
\q              /* salir de la consola de PostgreSQL */
\! cls          /* limpiar la consola */
\h              /* mostrar la lista de comandos */
\d+ nombre_tabla/* mostrar el DETALLE de una tabla */


/*=================================================*/
/* https://www.postgresql.org/docs/8.0/sql-createuser.html */
/*  CREAR USUARIOS  */
CREATE USER reneclavijo WITH <OPCIONES>;
/* OPCIONES
* PASSWORD
* ENCRYPTED PASSWORD
* UNENCRYPTED PASSWORD
* VALID UNTIL
* CREATEDB
* NOCREATEDB
* SUPERUSER
* NOSUPERUSER
*/

/* Asignar un usuario a una base de datos */
GRANT ALL PRIVILEGES ON DATABASE nombre_de_la_base_de_datos  TO nombre_de_usuario;


/*=================================================*/
/*  GESTIÓN BASE DE DATOS  */
/*  */
CREATE DATABASE nombre_de_la_base_de_datos;

/*cambiar de base de datos en consola*/
\c nombre_de_la_base_de_datos

DROP DATABASE nombre_de_la_base_de_datos;


/*=================================================*/
/* GESTIÓN DE TABLAS */
CREATE TABLE nombre_tabla (
    columna1 tipo_de_dato1,
    columna2 tipo_de_dato2,
    columna3 tipo_de_dato3,
    columna4 tipo_de_dato4,
    columna5 tipo_de_dato5,
    PRIMARY KEY (columnaN)
);

/* TIPO DE DATOS */
/*
* int
* smallint
* bigint
* float
* double
* char
* varchar   STRING | CADENAS
* date      fecha en formato YYYY/mm/dd
* time      tiempo en 24h
* timestamp tiempo en 24h
* boolean
*/

/* Agregar una columna */
ALTER TABLE nombre_tabla ADD nueva_columna tipo_de_dato;

/* Elimina una columna */
ALTER TABLE nombre_tabla DROP nombre_columna;

/* Elimina una tabla completa */
DROP TABLE nombre_tabla;            

/* Elimina solamente los registros de una tabla */
TRUNCATE TABLE nombre_tabla;        

/*=================================================*/
/* INSERTAR REGISTROS EN UNA TABLA */
INSERT INTO nombre_tabla    (columan1, columna2, columna3) 
                    VALUES  (valor1, valor2, valor3);
/* ACTUALIZAR REGISTROS EN UNA TABLA */
UPDATE nombre_tabla SET columna1 = valor_nuevo
WHERE condicion;

/* ELIMINAR UN REGISTRO */
/*🚨elimina todos los registros de la tabla🚨*/
DELETE FROM tabla;

DELETE FROM tabla WHERE condicion;


/*=================================================*/
/* CONSULTAR DATOS EN UNA TABLA */
SELECT * FROM tabla;