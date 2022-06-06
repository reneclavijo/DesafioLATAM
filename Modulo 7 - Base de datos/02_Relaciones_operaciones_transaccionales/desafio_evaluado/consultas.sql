/* 1. Cargar el respaldo de la base de datos unidad2.sql. (2 Puntos) */

/* Crear una base de datos vacía*/
psql
CREATE DATABASE tienda;
\q

-- En consola, terminal, o en windows CMD
psql -U reneclavijo tienda < '/Users/reneclavijo/Documents/DesafioLATAM/Modulo 7 - Base de datos/02_Relaciones_operaciones_transaccionales/desafio_evaluado/unidad2.sql'

/*
/** 2. El cliente usuario01 (ESTE DATO ESTÁ EN LA TABLA DE CLIENTE)
ha realizado la siguiente compra:
*● producto: producto9.     (ESTE DATO LO TIENE LA TABLA DE PRODUCTO)
*● cantidad: 5.              (ESTE DATO LO GUARDA LA TABLA DE DETALLE_COMPRA)
*● fecha: fecha del sistema. (ESTE DATO LO GUARDA LA TABLA DE COMPRA QUE SIMULA UNA BOLETA EN BLANCO)

¿como es que el usuario01 tiene una compra? Al crear registros en la tabla compra y detalle_compra*/
/*Mediante el uso de transacciones*/
BEGIN TRANSACTION;

INSERT INTO compra(cliente_id, fecha) /*creando la compra/boleta vacía para el usuario */
VALUES (1, NOW());

INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES 
(9, 40, 5);
/*Rebajar el stock en 5 del producto9 */
UPDATE producto SET stock = stock - 5 WHERE id = 9;
/*¿Validar? Si hay error, entonces ROLLBACK si todo bien COMMIT*/
COMMIT;
/*
, realiza las consultas correspondientes para este 
requerimiento y luego consulta la tabla producto para validar si fue efectivamente 
descontado en el stock. (3 Puntos)
*/

/* 3. El cliente usuario02 ha realizado la siguiente compra: (INGRESAR REGISTROS EN LA TABLA DE COMPRA Y DETALLE_COMPRA)

● producto: producto1, producto 2, producto 8.()
● cantidad: 3 de cada producto.               (Producto)
● fecha: fecha del sistema.                   (NOW())
Mediante el uso de transacciones,*/
BEGIN TRANSACTION;

INSERT INTO compra(cliente_id, fecha) VALUES (2, now());

/* Agregar detalle de la compra */
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES
                          (1,             41,            3),
                          (2,             41,            3),
                          (8,             41,            3)
;
/* Actualizar el stock de los productos */
UPDATE producto SET stock = stock  - 3 WHERE id = 1;
UPDATE producto SET stock = stock  - 3 WHERE id = 2;
UPDATE producto SET stock = stock  - 3 WHERE id = 8;

/* luego consulta la tabla producto para validar que si alguno de ellos 
se queda sin stock, no se realice la compra. (3 Puntos)
SI ALGO SALE MAL TENEMOS QUE HACER EL ROLLBACK
*/
ROLLBACK;


/* Estado actual de la base de datos */
/* Última compra está en 40 */

