# Ejercicios · Unidad 9

No se busca medir milisegundos: se busca razonar sobre claridad, filas y columnas necesarias.

## Muy guiados

1. Reescribe una consulta que obtenga todos los productos para que solo muestre nombre y precio de los activos.
2. Muestra identificador y fecha de los pedidos pendientes, ordenados por fecha. Explica qué filtro se aplica antes de ordenar.
3. Usa `EXPLAIN QUERY PLAN` para observar una consulta que encuentre al cliente con identificador 5.
4. Obtén los cinco productos de menor stock seleccionando solo las columnas necesarias.
5. Explica por qué una consulta con `LIMIT 5` debería llevar también un `ORDER BY` si se pretende elegir los cinco más baratos.

## Práctica repetida

6. Escribe y analiza el plan de una consulta que encuentre el pedido con identificador 40.
7. Muestra solo nombre y ciudad de los clientes de Madrid; compara esta necesidad con usar `SELECT *`.
8. Usa `EXPLAIN QUERY PLAN` con una consulta que una el pedido 12 y su cliente.
9. Prepara una consulta de productos activos ordenados por precio que no incluya columnas innecesarias.
10. Observa el plan de una consulta que agrupe pedidos por estado.
11. Explica qué columnas filtrarías o indexarías en un sistema real para buscar repetidamente pedidos de un cliente. No modifiques la base.
12. Compara el resultado de limitar productos sin ordenar y limitar después de ordenarlos por precio.

## Reto

13. Diseña una consulta clara para que almacén vea diez productos de menor stock activos y justifica cada cláusula.
14. Elabora una consulta y su plan para mostrar los pagos de un pedido concreto, sin seleccionar columnas superfluas.
15. Propón, con una frase por columna, qué índice estudiarías para acelerar consultas frecuentes sobre pedidos y por qué; no ejecutes cambios.
