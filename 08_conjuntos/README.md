# Unidad 8: combinar resultados

## El problema

A veces dos consultas devuelven la misma clase de dato y queremos reunirlas. `UNION` combina filas compatibles y elimina repetidas; `UNION ALL` conserva todas.

```sql
SELECT ciudad FROM clientes WHERE ciudad = 'Madrid'
UNION
SELECT ciudad FROM clientes WHERE ciudad = 'Barcelona';
```

## Reglas

Cada `SELECT` debe devolver el mismo número de columnas y datos comparables en cada posición. `INTERSECT` devuelve las filas comunes y `EXCEPT`, las que están en la primera consulta pero no en la segunda.

```sql
SELECT id_cliente FROM clientes
EXCEPT
SELECT id_cliente FROM pedidos;
```

## Errores habituales

- Intentar unir dos consultas con distinto número de columnas.
- Esperar duplicados de `UNION`: para eso existe `UNION ALL`.
- Ordenar cada parte: el `ORDER BY` se coloca al final del resultado combinado.
