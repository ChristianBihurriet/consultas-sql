-- Igualdad con texto.
SELECT nombre, apellidos FROM clientes WHERE ciudad = 'Madrid';
-- Comparación numérica.
SELECT nombre, precio, stock FROM productos WHERE precio >= 100;
-- Un producto que ya no está activo.
SELECT nombre, activo FROM productos WHERE activo = 0;
-- Dos condiciones que deben cumplirse.
SELECT nombre, precio, stock FROM productos WHERE precio < 80 AND stock < 30;
-- Una ciudad u otra.
SELECT nombre, ciudad FROM clientes WHERE ciudad = 'Sevilla' OR ciudad = 'Málaga';
-- Paréntesis: primero agrupamos las ciudades.
SELECT nombre, ciudad, telefono FROM clientes WHERE (ciudad = 'Madrid' OR ciudad = 'Barcelona') AND telefono IS NOT NULL;
-- Los valores no indicados se consultan con IS NULL.
SELECT nombre, apellidos FROM clientes WHERE telefono IS NULL;
-- NOT excluye las filas que cumplen una condición.
SELECT id_pedido, estado FROM pedidos WHERE NOT estado = 'Cancelado';
