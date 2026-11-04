# Unidad 9: leer y mejorar consultas

## El problema

Una consulta correcta puede ser lenta en una tabla grande. Primero debemos saber qué necesita el usuario, pedir solo esas columnas y filtrar las filas necesarias.

```sql
SELECT nombre, precio
FROM productos
WHERE activo = 1
ORDER BY precio;
```

Evita `SELECT *` cuando no necesitas todas las columnas. No añade velocidad por sí solo, pero reduce datos leídos y hace la consulta más clara.

## El plan de consulta

SQLite puede explicar cómo piensa obtener los datos con `EXPLAIN QUERY PLAN`. No modifica nada: sirve para observar.

```sql
EXPLAIN QUERY PLAN
SELECT id_pedido, fecha_pedido
FROM pedidos
WHERE id_cliente = 10;
```

Un índice puede ayudar a localizar valores en columnas usadas a menudo para unir, filtrar u ordenar. No crees índices por costumbre: ocupan espacio y hacen más lentas las modificaciones. En este laboratorio solo los analizamos.

## Errores habituales

- Optimizar antes de comprobar que la consulta da el resultado correcto.
- Suponer que un índice siempre mejora cualquier consulta.
- Usar funciones sobre una columna filtrada sin entender el efecto sobre el plan.

Ejecuta [ejemplos.sql](ejemplos.sql) y practica en [ejercicios.md](ejercicios.md).
