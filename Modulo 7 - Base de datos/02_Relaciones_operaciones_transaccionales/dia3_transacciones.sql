/* TRANSACCIONES */

/**
* !   ACID
* ? Atomicity   (Atomicidad)
* ? Consistency (Consistencia)
* ? Isolation   (Aislamiento)
* ? Durability  (Durabilidad)
* 
* COMANDOS PARA REALIZAR TRANASACCIOINES MANUALES
*
**COMANDO         |   DESCRIPCIÓN
* BEGIN           | El sistema premite que se ejecuten toda slas sentencias SQL que necesitemos
* SAVEPOINT       | Guarda el punto de partida al cual volver a la hora de aplicar ROLLBACK
* SET TRANSACTION | Le asigna nombre a la transacción
* COMMIT          | Guarda los cambios de la transacción
* ROLLBACK        | Retrocede los cambios realizados
*/

CREATE DATABASE banco;
\c banco

CREATE TABLE cuentas(
  numero_cuenta INTEGER NOT NULL UNIQUE PRIMARY KEY,
  balance       DECIMAL CHECK(balance >= 0.00) /* Que valide que el balance siempre sera mayor o igual a 0.0 */
);

INSERT INTO cuentas(numero_cuenta, balance)
VALUES 
(1, 1000.00),
(2, 1000.00)
;

/**
** 1. COMMIT
** Transferir 1000$ de la cuenta 1 a la cuenta 2
*/
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
COMMIT;


/**
** 2. ROLLBACK
** Transferir 1000$ de la cuenta 1 a la cuenta 2
*/
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
ROLLBACK;

/**
** 3. SAVEPOINT
*/
BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance)
VALUES (3, 5000.00);
SAVEPOINT creando_nueva_cuenta;
/**
** Intentar transferir 3000$ a la cuenta 3 de la cuenta 2
*/
ROLLBACK TO creando_nueva_cuenta;



/**
* ! AUTOCOMMIT
*/
\echo :AUTOCOMMIT
\set AUTOCOMMIT off

/**
* ? IMPORTAR / EXPORTAR BASE DE DATOS
*/

/**
* ! EXPORTAR TIENEN QUE ESTAR EN CONSOLA (NO EN PSQL)
* ! ejectuar este comando en CMD
* Exportar la BD = crear un archivo SQL
*/
pg_dump -U postgres tienda > copia_tienda.sql
pg_dump -U nombre_usuario nombre_bd > db.sql
/**
* ! IMPORTAR HAY QUE ESTAR DENTRO DEL PSQL
*/
/* 1. hay que crear una base de datos vacía */
psql
CREATE DATABASE nombre_bd_vacia;

/* 2. Ejectar el sql con la copia de seguridad */
psql -U postgres nombre_db < ruta_archivo_restauracion.sql
