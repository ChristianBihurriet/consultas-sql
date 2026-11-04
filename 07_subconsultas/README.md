# Unidad 7: una consulta dentro de otra

## El problema

Queremos productos más caros que el precio medio. Primero hay que calcular la media y después compararla: una subconsulta resuelve la pregunta interior.

```sql
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos);
```

La consulta entre paréntesis devuelve un valor. Se ejecuta para que la consulta exterior pueda usarlo.

## Un valor, una lista o una existencia

Una subconsulta puede devolver un valor (`=` o `>`), una lista (`IN`) o responder si existe algo (`EXISTS`).

```sql
SELECT nombre, apellidos
FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM pedidos);
```

## Errores habituales

- Usar `=` con una subconsulta que devuelve muchas filas: usa `IN` si necesitas una lista.
- Olvidar los paréntesis de la subconsulta.
- Hacer una subconsulta cuando un `JOIN` sería más fácil de leer. Ambas técnicas son útiles.

Ejecuta [ejemplos.sql](ejemplos.sql) antes de los [ejercicios.md](ejercicios.md).
