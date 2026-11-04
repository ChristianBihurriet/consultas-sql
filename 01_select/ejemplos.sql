-- 1. Todas las columnas de clientes. Útil para conocer una tabla.
SELECT *
FROM clientes;

-- 2. Solo elegimos las columnas que necesitamos.
SELECT nombre, apellidos, ciudad
FROM clientes;

-- 3. Un alias cambia el encabezado mostrado, no el nombre real de la columna.
SELECT nombre AS cliente, email AS correo_electronico
FROM clientes;

-- 4. Consultar productos mostrando una selección de sus datos.
SELECT nombre, precio, stock
FROM productos;

-- 5. Una expresión también puede tener alias.
SELECT nombre, precio, precio * 1.21 AS precio_con_iva
FROM productos;

-- 6. Podemos dar alias a las tablas para escribir consultas más legibles.
SELECT p.nombre AS producto, p.precio AS precio_sin_iva
FROM productos AS p;
