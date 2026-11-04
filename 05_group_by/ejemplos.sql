SELECT ciudad, COUNT(*) AS total_clientes FROM clientes GROUP BY ciudad;
SELECT id_categoria, COUNT(*) AS total_productos FROM productos GROUP BY id_categoria;
SELECT estado, COUNT(*) AS total_pedidos FROM pedidos GROUP BY estado;
SELECT metodo, COUNT(*) AS numero_pagos, SUM(importe) AS importe FROM pagos GROUP BY metodo;
SELECT estado_pago, AVG(importe) AS importe_medio FROM pagos GROUP BY estado_pago;
SELECT id_cliente, COUNT(*) AS pedidos_realizados FROM pedidos GROUP BY id_cliente HAVING COUNT(*) >= 4;
SELECT ciudad, COUNT(*) AS total FROM clientes GROUP BY ciudad ORDER BY total DESC;
SELECT id_producto, SUM(cantidad) AS unidades FROM detalle_pedido GROUP BY id_producto HAVING SUM(cantidad) >= 10;
