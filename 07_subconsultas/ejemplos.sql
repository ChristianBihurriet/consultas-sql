-- Productos por encima del precio medio.
SELECT nombre, precio FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);
-- Productos con el precio máximo.
SELECT nombre, precio FROM productos WHERE precio = (SELECT MAX(precio) FROM productos);
-- Clientes que han realizado pedidos: una lista de identificadores.
SELECT nombre, apellidos FROM clientes WHERE id_cliente IN (SELECT id_cliente FROM pedidos);
-- Clientes sin pedidos.
SELECT nombre, apellidos FROM clientes WHERE id_cliente NOT IN (SELECT id_cliente FROM pedidos);
-- Productos vendidos al menos una vez.
SELECT nombre FROM productos WHERE id_producto IN (SELECT id_producto FROM detalle_pedido);
-- Pedidos cuyo importe de pago supera el importe medio de pago.
SELECT id_pedido, importe FROM pagos WHERE importe > (SELECT AVG(importe) FROM pagos);
-- EXISTS comprueba que haya al menos una línea del producto.
SELECT pr.nombre FROM productos AS pr WHERE EXISTS (SELECT 1 FROM detalle_pedido AS d WHERE d.id_producto = pr.id_producto);
-- Productos de categorías que contienen más de diez productos.
SELECT nombre FROM productos WHERE id_categoria IN (SELECT id_categoria FROM productos GROUP BY id_categoria HAVING COUNT(*) >= 10);
