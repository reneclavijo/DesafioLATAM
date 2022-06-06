/* 🎈 RESTRICCIONES
* NOT NULL      Evitar valores NULL en la columna    
* UNIQUE        Evita valores repetidos en la columna
* SERIAL        PARA NÚMEROS. se auto incrementa
* CHECK         Agregar una restricción a una columna CHECK (Edad >= 18)
* PRIMARY KEY   Identificador único de un registro en una tabla
* FOREIGN KEY   Almacena llaves de otras tablas para relacionar valores
* DEFAULT       Valor por defecto de la columna
/* LLAVES PRIMARIA Y FORÁNEA */
CREATE TABLE nombre_tabla(
    columna1 tipo1 RESTRICCION1,
    columna2 tipo2 RESTRICCION2,
    columna3 tipo3 RESTRICCION3,
    PRIMARY KEY (columna)
);

/* 🎈 Ejemplo de uso de restricciones completo*/
CREATE TABLE equipos(
    id  SERIAL,
    nombre varchar NOT  NULL DEFAULT 'sin nombre',
    PRIMARY KEY(id)
);

CREATE TABLE ciclistas(
    id          SERIAL,
    nombre      varchar DEFAULT 'cilicsta1',
    tiempo      varchar NOT NULL,
    equipo_id   integer NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);

/* 🎈 EJECTUAR sql desde consola */
\i direccion_archivo.sql

/* 🎈 DOCUMENTACIÓN */
/* https://www.w3schools.com/sql/default.asp */

/* 🎈 CREAR TABLA DE POKEMON */

CREATE TABLE pokemones(
    pokedex INTEGER,
    nombre  VARCHAR,
    tipo1   VARCHAR,
    tipo2   VARCHAR,
    PRIMARY KEY(pokedex)
);

/* CARGAR */
\copy pokemones FROM 'D:\_DeafioLATAM\Modulo 7 - Base de datos\pokemonesKanto.csv' csv header;

CREATE TABLE capturados(
    pokedex         INTEGER,
    fecha_captura   DATE,
    lugar           VARCHAR,
    huevo           BOOLEAN,
    peso            FLOAT,
    estatura        FLOAT,
    FOREIGN KEY (pokedex) REFERENCES pokemones(pokedex)
);

\copy capturados FROM 'D:\_DeafioLATAM\Modulo 7 - Base de datos\mis_pokemones.csv' csv header;



/* 🎈 SELECT  WHERE */
SELECT columna1, columna2 FROM tabla WHERE condicion;
/** 
    * * OPERADORES
    * =
    * >
    * <
    * >=
    * <=
    * <>, !=      DIFERENTE DE
    * BETWEEN     NORMALMENTE PARA LAS FECHAS
    * LIKE        BUSCAR PATRONES DE TEXTO
    * IN          AGRUPA VALORES DE BÚSQUEDA
*/

/**
*   * LIMITES
*/

SELECT columna1, columna2 FROM tabla LIMIT cantidad;

/* Métodos MIN | MAX | LENGTH | COUNT | SUM */
SELECT MIN(columna) FROM tabla;
SELECT MAX(columna) FROM tabla;
SELECT LENGTH(columna) FROM tabla;
SELECT COUNT(columna) FROM tabla;
SELECT SUM(columna) FROM tabla;

/* ORDER BY */
SELECT columna FROM tabla ORDER BY columna DESC | ASC;

/* GROUP BY */
SELECT columna FROM tabla GROUP BY columna;

SELECT *
FROM pokemones
WHERE tipo1 IN ('veneno', 'fuego')
ORDER BY tipo1 DESC;

/* 🎈 Alias de columnas y tablas */
SELECT columnas AS alias_columna 
FROM tabla AS alias_tabla;

SELECT tipo1, COUNT(pokedex)
FROM pokemones
GROUP BY tipo1
ORDER BY tipo1
LIMIT 10;


/* 🎈 Índices */
CREATE INDEX nombre_indice ON tabla(columna);
DROP INDEX nombre_indice;

/* Por buenas prácticas se coloca */
CREATE INDEX index_nombre_columna ON tabla(columna);

/* SI no nos acordamos de qué índices tiene la tabla se hace la siguiente consulta */
SELECT * FROM pg_indexes WHERE tablename = 'nombre_tabla';
















