CREATE SCHEMA NORTHWIND;
USE NORTHWIND

-- 4. Conociendo a las empleadas:
-- Obtener una lista con los datos de las empleadas y empleados de la empresa Northwind. 
-- Esta consulta incluirá los campos employee_id, last_name y first_name. 

SELECT employee_id, last_name, first_name
FROM employees;

-- 5. Conociendo los productos más baratos:
--  identificar aquellos productos (tabla products) cuyos precios por unidad oscilen entre 0 y 5 dólares
--  es decir, los productos más asequibles.

SELECT product_name, product_id, category_id, unit_price, discontinued
FROM products
WHERE unit_price BETWEEN 0 AND 5;

-- 6. Conociendo los productos que no tienen precio:
-- Seleccionar aquellos productos que no tengan precio, porque lo hayan dejado vacio al introducir los datos (NULL)

SELECT *
FROM products
WHERE unit_price = NULL;

-- 7. Comparando productos:
-- Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero 
-- sólo aquellos que tienen un ID menor que 10 (para tener una muestra significativa pero no tener que ver todos los productos existentes).

SELECT product_id, product_name,unit_price
FROM products
WHERE product_id < 10 AND unit_price < 15;

-- 8. Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo invirtiendo el uso de los operadores 
-- y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 10

SELECT product_id, product_name, unit_price
FROM products
WHERE NOT product_id < 10 AND unit_price > 15;

-- 9. Conociendo los paises a los que vendemos
-- datos de los países que hacen pedidos 

SELECT DISTINCT ship_country
FROM orders;

-- 10. Conociendo el tipo de productos que vendemos en Northwind:
-- Crea una consulta que muestre los primeros 10 productos según su ID y 
-- que nos indique el nombre de dichos productos y sus precios.

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id ASC
LIMIT 10;

-- 11 Ordenando los resultados:
-- Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;


-- 12. Que pedidos tenemos en nuestra BBDD:
-- Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).

SELECT DISTINCT order_id 
FROM order_details;

-- 13. Qué pedidos han gastado más:
-- Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, 
-- desde la dirección nos piden conocer los 3 pedidos que han supuesto un mayor ingreso para la empresa.
-- Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price y quantity para calcular el importe total.

SELECT  order_id, ROUND(SUM(unit_price*quantity),2) AS importe_total
FROM order_details
GROUP BY order_id
ORDER BY importe_total DESC
LIMIT 3;

-- 14. Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:
-- Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar 
-- el ID de los pedidos situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.

SELECT  order_id, ROUND(SUM(unit_price*quantity),2) AS importe_total
FROM order_details
GROUP BY order_id
ORDER BY importe_total DESC
LIMIT 6
OFFSET 4;

-- 15. Qué categorías tenemos en nuestra BBDD:
-- De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías que componen los tipos de pedido 
-- de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".

SELECT category_id, category_name AS 'NombredeCategoria'
FROM categories;

-- 16. Selecciona envios con retraso:
-- cuál sería la fecha de envío (ShippedDate) de los pedidos almacenados en la base de datos, 
-- si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.