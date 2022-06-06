/**
* ?                                     TABLAS
**       autos
*       | id 🔑 | marca | modelo | año | color
**       ventas
*       | fecha | id_auto | cliente | referencia | cantidad
*
* ?                                     ENUNCIADO           
* Las pruebas a realizar deben ser:                                             */
/** 1. Creación de la base de datos.                                            */
CREATE DATABASE venta_autos;
/** 2. Conexión con la base de datos.                                           */
\c venta_autos
/** 3. Crear las tablas Autos y Ventas enlazadas por claves primaria-foranea.   */
CREATE TABLE autos(
    id      SERIAL,
    marca   VARCHAR,
    modelo  VARCHAR,
    año     INTEGER,
    color   VARCHAR,
    PRIMARY KEY(id)
);

CREATE TABLE ventas(
    id          SERIAL,
    fecha       DATE,
    cliente     VARCHAR,
    referencia  VARCHAR,
    cantidad    INTEGER,
    id_auto     INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(id_auto) REFERENCES autos(id)
);
/** 4. Importar el archivo autos.csv en la tabla Autos.                         */
\copy autos FROM 'D:\_DeafioLATAM\Modulo 7 - Base de datos\01_Base de datos relacionales\autos\autos.csv' csv header;
/** 5. Verificar la carga exitosa de la data en la tabla Autos.                 */
SELECT * FROM autos;
/** 6. Hacer una consulta con Alias.                                            */
SELECT  año as año_lanzamiento, marca, modelo, color FROM autos;
/** 7. Realizar 2 ventas.                                                       */}

INSERT INTO ventas(fecha, cliente, referencia, cantidad, id_auto)
VALUES 
('2022-05-24',  'Fabio',    'Nuestra primera venta 😂', 1, 4),
(now(), 'Andrea',   'Esto va creciendo 🍻',     2, 2)
;

INSERT INTO ventas(fecha, cliente, referencia, cantidad, id_auto)
VALUES
(CURRENT_DATE, 'Camilo', 'La venta millonaria 💰💰', 10, 1);

SELECT * FROM ventas;

/** 8. Obtener la suma de todos los autos vendidos.                             */
SELECT SUM(cantidad) AS autos_vendidos FROM ventas;

/** 9. Agregar la columna medio_pago en la tabla de ventas (TARJETA | EFECTIVO) */
ALTER TABLE ventas ADD medio_pago VARCHAR;

UPDATE ventas SET medio_pago = 'TARJETA'; /*🚨🚨🚨🚨🚨🚨*/
UPDATE ventas SET medio_pago = 'EFECTIVO' WHERE id = 2;

/** 10. Agregar un registro a la tabla Autos para un BMW.                       */
INSERT INTO autos (marca, modelo, año, color)
VALUES ('BMW', 'X6', 2019, 'VERDE');
    /* REINICIAR EL CONTADOR SERIAL EN 5 */
    SELECT setval('autos_id_seq', 5, true);

INSERT INTO autos(marca, modelo, año, color)
VALUES ('Renault', 'Sander', 2018, 'ROJO');

INSERT INTO autos(id, marca, modelo, año, color)
VALUES (6, 'Audi', 'A7', 2015, 'PLATEADO');

INSERT INTO autos(marca, modelo, año, color)
VALUES ('Volkswagen', 'Gol', 2017, 'NEGRO');

/************ 🌠BONUS🌟 *************/
/** 11. El último cliente que compro un auto, decidió comprar 2, actualizar 
/**     la BD.                                                                  */
UPDATE ventas SET cantidad = 2 WHERE id = 3;

/** 12. Mostrar todas las marcas de autos disponibles para la venta.            */
SELECT marca FROM autos;

/** 13. Ordenar los autos registrados del más nuevo al más viejo.               */
SELECT año FROM autos ORDER BY  año DESC;
SELECT * FROM autos ORDER BY  año DESC;

/** 14. Debido a que siempre se hace la búsqueda por marca de autos o color, 
/**     agregar dos índices para cada columna y así mejorar el rendimiento de 
/**     las búsquedas.                                                          */
create index I_color on autos(color);
create index I_marca on autos(marca);

/** 15. Eliminar un índice a una columna.                                       */
Drop index I_color;

/** 16. Registrar 5 ventas nuevas para el de febrero.                           */
INSERT INTO ventas(fecha, cliente, referencia, cantidad, id_auto, medio_pago)
VALUES 
('2022-02-12', 'Julio',     'Nueva venta 1',     3, 3, 'Tarjeta'),
('2022-02-01', 'Erik',      'Nueva venta 2',     1, 1, 'Efectivo'),
('2022-02-25', 'Pedro',     'Nueva venta 3',     5, 4, 'Tarjeta'),
('2022-02-10', 'Cristobal', 'Nueva venta 4',     2, 2, 'Efectivo'),
('2022-02-16', 'Camila',    'Nueva venta 5',     1, 1, 'Tarjeta')
;

/** 17. Agregar la columna de precio en la tabla de autos.                      */
ALTER TABLE autos ADD precio INTEGER;

/** 18. Actualizar los autos registrados con precios desde 10000 - 50000.       */
ALTER TABLE autos ADD precio_auto INTEGER; 
UPDATE autos SET precio_auto = 10000;

/** 19. Obtener el auto más caro                                                */
SELECT MAX(precio) as carisimo FROM autos;          /*opt1*/
SELECT * FROM autos ORDER BY precio DESC LIMIT 1;   /*opt2*/

/** 20. Contar cuántas ventas se ha realizado por auto                          */
SELECT id_auto, COUNT(id_auto) FROM ventas GROUP BY id_auto; 
