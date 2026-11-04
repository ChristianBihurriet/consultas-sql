# Unidad 1: mirar los datos con `SELECT`

## El problema

La tienda ya tiene clientes, productos y pedidos. Antes de decidir qué vender o a quién escribir, necesitamos **ver los datos**. No vamos a modificar nada: solo haremos preguntas a la base de datos.

## La idea

Una tabla se parece a una hoja de cálculo: cada fila es un registro y cada columna guarda una característica. `SELECT` indica qué columnas queremos ver y `FROM` de qué tabla salen.

```sql
SELECT nombre, ciudad
FROM clientes;
```

El resultado tendrá una fila por cliente y dos columnas: su nombre y su ciudad.

## Primeros pasos en VS Code

1. Abre la carpeta del repositorio con **Archivo > Abrir carpeta**.
2. Instala la extensión recomendada **SQLite IntelliView** cuando VS Code lo sugiera.
3. En el explorador, abre `datos/tienda.db`. Si aparece la opción, elige **Open With… > SQLite Database IntelliView**.
4. En la vista de la base de datos abre una tabla para mirar sus datos o la pestaña **Query** para escribir una consulta.
5. Copia una consulta de `ejemplos.sql`, ejecútala y observa el resultado.

La actividad está planteada como laboratorio de lectura. No dependas de que la extensión guarde cambios: no edites la base de datos compartida.

## `SELECT`, `FROM` y columnas

La forma básica es:

```sql
SELECT columna1, columna2
FROM nombre_tabla;
```

Para ver todas las columnas se puede usar `*`:

```sql
SELECT *
FROM categorias;
```

Es útil al explorar, pero en consultas reales conviene nombrar las columnas: el resultado queda más claro y no muestra información innecesaria.

## Alias: nombres más claros en el resultado

`AS` permite dar un nombre temporal a una columna o a una tabla.

```sql
SELECT nombre AS producto, precio AS precio_euros
FROM productos;
```

La tabla sigue teniendo las columnas `nombre` y `precio`; solo cambian los títulos del resultado. También puedes escribir `FROM productos AS p` y usar `p.nombre` para dejar claro de dónde procede una columna.

## Qué explorar

En esta base existen `clientes`, `categorias`, `productos`, `pedidos`, `detalle_pedido` y `pagos`. De momento consulta una sola tabla cada vez. Más adelante relacionaremos tablas.

## Errores habituales

- Escribir el nombre de una columna inexistente: revisa la pestaña **Schema** de IntelliView.
- Olvidar `FROM`: SQL necesita saber de qué tabla obtiene los datos.
- Confundir mayúsculas y minúsculas no suele ser un problema en SQLite, pero escribe los nombres de forma consistente.
- Usar comas después de la última columna: `SELECT nombre, ciudad FROM clientes;` no lleva coma tras `ciudad`.
- Pensar que `AS` cambia la base de datos: solo cambia el encabezado mostrado por esa consulta.

Abre [ejemplos.sql](ejemplos.sql) antes de empezar los ejercicios.
