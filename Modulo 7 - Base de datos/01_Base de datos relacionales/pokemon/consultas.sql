/* ¿CÓMO OBTENEMOS LOS PRIMEROS
5 POKEMONES ?  */

SELECT *
FROM pokemones
LIMIT 5;

/* ¿CÓMO OBTENEMOS LOS ÚLTIMOS 10
POKEMON ? */

SELECT *
FROM pokemones
ORDER BY pokedex DESC /*ASC*/
LIMIT 10;

/* ORDER LOS POKEMONS POR SUS TIPOS Y SI 
*  NO TIENE UN TIPO2, ORDENARLO EN ORDEN ALFABÉTICO
*/

SELECT *
FROM pokemones
ORDER BY tipo1, tipo2, nombre;

/*  
*   MOSTRAR TODOS LOS TIPOS DE POKEMON REGISTRADOS
*/
SELECT tipo1
FROM pokemones
GROUP BY tipo1;

/*  
*   MOSTRAR LOS LUGARES DONDE HEMOS CAPTURADOS POKEMONES
*/
SELECT lugar AS lugares_donde_has_capturado_pokemones
FROM capturados
GROUP BY lugar;

/*  
*   ¿CÓMO AGRUPAR POR LOS TIPO1 DE POKEMON ?
*/

SELECT tipo1
FROM pokemones
GROUP BY tipo1;

/*  
*   ¿CÓMO SABER CUÁNTOS POKEMONES HAY POR TIPO ?
*/

SELECT tipo1 AS tipos, 
COUNT(pokedex) as X_POKEDEX,
COUNT(tipo2) as X_TIPO2
FROM pokemones
GROUP BY tipo1;

/*
*   ¿CUÁNTO SUMA LOS NÚMEROS DEL POKEDEX?
*   SUM
*   1 + 2 + 3 + 4 + 5 + .... + 151 = 11476
*/

SELECT SUM(pokedex)
FROM pokemones;