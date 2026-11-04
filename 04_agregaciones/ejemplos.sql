SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT COUNT(telefono) AS clientes_con_telefono FROM clientes;
SELECT MIN(precio) AS precio_minimo, MAX(precio) AS precio_maximo FROM productos;
SELECT AVG(precio) AS precio_medio FROM productos;
SELECT SUM(stock) AS unidades_en_almacen FROM productos;
SELECT COUNT(*) AS pedidos_pendientes FROM pedidos WHERE estado = 'Pendiente';
SELECT AVG(precio) AS media_activos FROM productos WHERE activo = 1;
SELECT SUM(cantidad * precio_unitario) AS importe_total_lineas FROM detalle_pedido;
