# Unidad 5: un resumen para cada grupo

## El problema

Ahora queremos saber cuántos clientes hay **en cada ciudad**, no solo el total. `GROUP BY` reúne filas con el mismo valor antes de aplicar una función.

```sql
SELECT ciudad, COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad;
```

## Filtrar antes y después

`WHERE` decide qué filas entran al grupo. `HAVING` decide qué grupos aparecen después del resumen.

```sql
SELECT estado, COUNT(*) AS total
FROM pedidos
WHERE fecha_pedido >= '2026-05-01'
GROUP BY estado
HAVING COUNT(*) >= 5;
```

## Errores habituales

- Usar `WHERE COUNT(*) > 2`: los grupos todavía no existen; usa `HAVING`.
- Mostrar una columna no agrupada ni resumida: elige con claridad qué representa cada fila.
- Olvidar ordenar el resumen cuando ayuda a interpretarlo.

Ejecuta [ejemplos.sql](ejemplos.sql) y continúa con [ejercicios.md](ejercicios.md).
