-- Ciudades seleccionadas, sin repetición.
SELECT ciudad FROM clientes WHERE ciudad = 'Madrid' UNION SELECT ciudad FROM clientes WHERE ciudad = 'Barcelona';
-- Las mismas ciudades, conservando filas repetidas.
SELECT ciudad FROM clientes WHERE ciudad = 'Madrid' UNION ALL SELECT ciudad FROM clientes WHERE ciudad = 'Barcelona';
-- Clientes con pedido frente a todos los clientes: los que no tienen pedido.
SELECT id_cliente FROM clientes EXCEPT SELECT id_cliente FROM pedidos;
-- Productos que han sido vendidos.
SELECT id_producto FROM productos INTERSECT SELECT id_producto FROM detalle_pedido;
-- Dos listas de personas con etiquetas compatibles.
SELECT nombre AS persona, ciudad FROM clientes WHERE ciudad = 'Sevilla' UNION SELECT nombre, ciudad FROM clientes WHERE ciudad = 'Málaga' ORDER BY ciudad, persona;
