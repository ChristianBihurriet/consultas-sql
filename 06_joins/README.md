# Unidad 6: relacionar tablas con `JOIN`

## El problema

Un pedido guarda el identificador de cliente, no su nombre. Un `JOIN` une las filas relacionadas para obtener información de varias tablas.

```sql
SELECT p.id_pedido, c.nombre, c.apellidos
FROM pedidos AS p
INNER JOIN clientes AS c ON p.id_cliente = c.id_cliente;
```

`ON` expresa la relación; no es un filtro cualquiera. Los alias ayudan a distinguir columnas con el mismo nombre.

## `INNER JOIN` y `LEFT JOIN`

`INNER JOIN` solo muestra coincidencias. `LEFT JOIN` conserva todas las filas de la tabla izquierda; si no hay coincidencia, las columnas de la derecha valen `NULL`.

```sql
SELECT c.nombre, c.apellidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;
```

El ejemplo encuentra clientes sin pedidos.

## Errores habituales

- Unir tablas sin `ON`: se multiplican filas sin relación útil.
- Filtrar una columna de la tabla derecha con `WHERE` tras un `LEFT JOIN`: puede eliminar los `NULL` buscados.
- Unir por columnas parecidas en vez de usar la clave foránea.

Consulta [ejemplos.sql](ejemplos.sql) y practica con [ejercicios.md](ejercicios.md).
