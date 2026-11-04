-- Cada pedido junto a su cliente.
SELECT p.id_pedido, p.fecha_pedido, c.nombre, c.apellidos FROM pedidos AS p INNER JOIN clientes AS c ON p.id_cliente = c.id_cliente;
-- Cada producto con el identificador de su categoría.
SELECT pr.nombre, pr.precio, ca.nombre AS categoria FROM productos AS pr INNER JOIN categorias AS ca ON pr.id_categoria = ca.id_categoria;
-- Líneas de pedido con el producto que contienen.
SELECT d.id_pedido, pr.nombre, d.cantidad, d.precio_unitario FROM detalle_pedido AS d INNER JOIN productos AS pr ON d.id_producto = pr.id_producto;
-- Tres tablas: pedido, cliente y pago.
SELECT p.id_pedido, c.nombre, pa.importe, pa.estado_pago FROM pedidos AS p INNER JOIN clientes AS c ON p.id_cliente = c.id_cliente INNER JOIN pagos AS pa ON pa.id_pedido = p.id_pedido;
-- Conservamos todos los clientes, tengan o no pedidos.
SELECT c.nombre, c.apellidos, p.id_pedido FROM clientes AS c LEFT JOIN pedidos AS p ON p.id_cliente = c.id_cliente;
-- Productos que no aparecen en ninguna línea de pedido.
SELECT pr.nombre FROM productos AS pr LEFT JOIN detalle_pedido AS d ON d.id_producto = pr.id_producto WHERE d.id_detalle IS NULL;
-- Pedidos sin pago registrado.
SELECT p.id_pedido, p.estado FROM pedidos AS p LEFT JOIN pagos AS pa ON pa.id_pedido = p.id_pedido WHERE pa.id_pago IS NULL;
-- Cuatro tablas para leer una línea en contexto.
SELECT p.id_pedido, c.nombre AS cliente, pr.nombre AS producto, d.cantidad FROM pedidos AS p INNER JOIN clientes AS c ON c.id_cliente = p.id_cliente INNER JOIN detalle_pedido AS d ON d.id_pedido = p.id_pedido INNER JOIN productos AS pr ON pr.id_producto = d.id_producto;
