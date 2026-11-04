# Ejercicios · Unidad 1

Ejecuta cada consulta en la pestaña **Query**. Describe con una frase qué columnas aparecen y qué representa cada fila.

## Inicial

1. Escribe una consulta sobre `categorias` que muestre todas sus columnas. Pista: aún no necesitas elegir columnas una a una.
2. Para preparar un listado de clientes, usa `clientes` y muestra exactamente `nombre` y `ciudad`.
3. Atención al cliente necesita nombre, apellidos y correo electrónico de cada cliente. Consulta una sola tabla.
4. El catálogo debe mostrar el nombre y el precio de cada producto. Usa `productos`.

## En marcha

5. Consulta `categorias` para ver su nombre y descripción; no muestres el identificador.
6. En `pedidos`, muestra el identificador del pedido y su fecha.
7. Almacén necesita el nombre del producto y las unidades disponibles. Localiza esas dos columnas en `productos`.
8. Explora todos los campos de `pagos` antes de hacer consultas más concretas.
9. Examina todas las columnas de una línea de pedido en `detalle_pedido`.

## Reto

10. Presenta nombre y precio de los productos con los encabezados `producto` y `precio_euros`. Pista: los alias cambian el título, no la tabla.
11. Elabora un listado de clientes con encabezados legibles: `cliente` y `localidad`.
12. Dirección quiere comparar el precio de catálogo con el precio que paga el cliente al aplicar un IVA del 21 %. Crea una columna calculada y nómbrala claramente.
13. Escribe la consulta de nombre y stock usando un alias corto para `productos`.
14. Diseña una salida comprensible para administración con identificador, método y estado de cada pago. Decide tú los alias apropiados.
15. Prepara para recepción una lista de pedidos con identificador, fecha y estado, usando encabezados claros para esas tres columnas.
