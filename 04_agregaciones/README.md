# Unidad 4: resumir con funciones

## El problema

En lugar de leer 80 precios, queremos responder: «¿cuántos productos hay?» o «¿cuál es su precio medio?». Las funciones de agregación devuelven un resumen.

```sql
SELECT COUNT(*) AS total_productos, AVG(precio) AS precio_medio
FROM productos;
```

## Funciones básicas

`COUNT(*)` cuenta filas. `SUM` suma valores; `AVG` calcula la media; `MIN` y `MAX` buscan el menor y mayor. Las funciones ignoran `NULL`, salvo `COUNT(*)`, que cuenta cada fila.

```sql
SELECT MIN(precio) AS mas_barato, MAX(precio) AS mas_caro FROM productos;
SELECT SUM(cantidad * precio_unitario) AS importe_lineas FROM detalle_pedido;
```

## Errores habituales

- `COUNT(telefono)` no cuenta teléfonos nulos; `COUNT(*)` cuenta todas las filas.
- Sin `GROUP BY`, el resultado es un único resumen.
- Da un alias a los cálculos largos para que el resultado se entienda.

Prueba [ejemplos.sql](ejemplos.sql) y practica en [ejercicios.md](ejercicios.md).
