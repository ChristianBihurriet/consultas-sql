# Unidad 3: ordenar, buscar y limitar

## El problema

Una lista sin orden obliga a buscar a ojo. `ORDER BY` organiza el resultado; `ASC` es ascendente y `DESC`, descendente.

```sql
SELECT nombre, precio
FROM productos
ORDER BY precio DESC;
```

## Buscar patrones y listas

`LIKE` busca texto con `%` para «cualquier cantidad de caracteres». `IN` comprueba si un valor está en una lista; `BETWEEN` incluye los dos límites.

```sql
SELECT nombre, precio
FROM productos
WHERE precio BETWEEN 20 AND 50
ORDER BY precio;
```

## Resultados distintos y pocos resultados

`DISTINCT` elimina repeticiones de la selección. `LIMIT` muestra solo las primeras filas después de ordenar.

```sql
SELECT DISTINCT ciudad FROM clientes;
SELECT nombre, stock FROM productos ORDER BY stock ASC LIMIT 5;
```

## Errores habituales

- Usar `LIMIT` antes de `ORDER BY`: primero se ordena y después se recorta.
- Esperar que `LIKE 'ana'` encuentre `Ana`: usa `%ana%` si buscas una parte.
- Pensar que `BETWEEN 10 AND 20` excluye 10 o 20: los incluye.

Consulta [ejemplos.sql](ejemplos.sql) y resuelve [ejercicios.md](ejercicios.md).
