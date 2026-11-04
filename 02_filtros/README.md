# Unidad 2: elegir filas con `WHERE`

## El problema

Un catálogo con 80 productos no sirve si almacén necesita solo los que tienen poco stock. `WHERE` conserva las filas que cumplen una condición.

```sql
SELECT nombre, stock
FROM productos
WHERE stock < 15;
```

Lee la frase como: «muestra nombre y stock **de** productos **donde** el stock sea menor que 15».

## Comparar y combinar

Usa `=`, `<>`, `<`, `>`, `<=` y `>=`. Para exigir dos condiciones utiliza `AND`; para aceptar una u otra, `OR`; para negar una, `NOT`.

```sql
SELECT nombre, ciudad
FROM clientes
WHERE ciudad = 'Madrid' AND telefono IS NOT NULL;
```

Los textos se escriben entre comillas simples. Los números no las necesitan.

## `NULL` no es un texto

`NULL` significa «dato desconocido o no indicado». No se compara con `=`: se pregunta con `IS NULL` o `IS NOT NULL`.

```sql
SELECT nombre, apellidos
FROM clientes
WHERE telefono IS NULL;
```

## Errores habituales

- Escribir `ciudad = Madrid`: falta rodear el texto con comillas.
- Usar `telefono = NULL`: debe ser `telefono IS NULL`.
- Usar `OR` cuando ambas condiciones deben cumplirse.
- Olvidar paréntesis cuando combinas varios `AND` y `OR`.

Ejecuta primero [ejemplos.sql](ejemplos.sql) y después practica en [ejercicios.md](ejercicios.md).
