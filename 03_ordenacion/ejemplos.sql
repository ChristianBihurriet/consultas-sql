-- Orden alfabético por dos columnas.
SELECT nombre, apellidos, ciudad FROM clientes ORDER BY ciudad ASC, apellidos ASC;
-- Los cinco productos con menor stock.
SELECT nombre, stock FROM productos ORDER BY stock ASC LIMIT 5;
-- Ciudades sin repetir.
SELECT DISTINCT ciudad FROM clientes ORDER BY ciudad;
-- Un nombre que contiene una palabra.
SELECT nombre, precio FROM productos WHERE nombre LIKE '%USB%';
-- Estados concretos de pedido.
SELECT id_pedido, estado FROM pedidos WHERE estado IN ('Pendiente', 'Enviado');
-- Precios dentro de un intervalo, incluidos los extremos.
SELECT nombre, precio FROM productos WHERE precio BETWEEN 30 AND 70 ORDER BY precio;
-- Una búsqueda que termina en Plus.
SELECT nombre FROM productos WHERE nombre LIKE '%Plus';
-- Combinamos filtro, orden y límite.
SELECT nombre, precio FROM productos WHERE activo = 1 ORDER BY precio DESC LIMIT 10;
