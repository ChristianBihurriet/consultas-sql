-- Un resultado explícito en vez de todas las columnas.
SELECT nombre, precio FROM productos WHERE activo = 1;
-- Filtramos antes de ordenar las filas que nos interesan.
SELECT id_pedido, fecha_pedido FROM pedidos WHERE estado = 'Pendiente' ORDER BY fecha_pedido;
-- El plan no ejecuta cambios: explica la búsqueda por clave primaria.
EXPLAIN QUERY PLAN SELECT nombre, ciudad FROM clientes WHERE id_cliente = 10;
-- Observamos el plan de una unión por clave foránea.
EXPLAIN QUERY PLAN SELECT p.id_pedido, c.nombre FROM pedidos AS p INNER JOIN clientes AS c ON c.id_cliente = p.id_cliente WHERE p.id_pedido = 20;
-- Un límite con un orden definido evita resultados arbitrarios.
SELECT nombre, stock FROM productos ORDER BY stock ASC LIMIT 5;
-- El plan de una consulta de resumen.
EXPLAIN QUERY PLAN SELECT estado, COUNT(*) FROM pedidos GROUP BY estado;
