USE tienda_northwind

-- Productos más baratos y caros de nuestra BBDD:
-- Desde la división de productos nos piden conocer el precio de los productos que tienen el precio más alto y más bajo. 
-- Dales el alias lowestPrice y highestPrice.

SELECT *
FROM products;

SELECT  MIN(unit_price) AS 'lowestPrice', MAX(unit_price) AS 'highestPrice'
FROM products;

-- Conociendo el numero de productos y su precio medio:
-- Adicionalmente nos piden que diseñemos otra consulta para conocer el número de productos y el precio medio de todos ellos 
-- (en general, no por cada producto).
 
SELECT *
FROM products;

SELECT COUNT(product_id) AS 'Recuento Art.' , AVG(unit_price) AS 'Media Total'
FROM products;

-- Sacad la máxima y mínima carga de los pedidos de UK:
-- Nuestro siguiente encargo consiste en preparar una consulta que devuelva la máxima y mínima cantidad de carga para un pedido (freight) 
-- enviado a Reino Unido (United Kingdom).

SELECT *
FROM orders;

SELECT MIN(freight) AS 'Carga minima', MAX(freight) AS 'Carga Maxima'
FROM orders
WHERE ship_country = 'UK';

/* Qué productos se venden por encima del precio medio:
Después de analizar los resultados de alguna de nuestras consultas anteriores, 
desde el departamento de Ventas quieren conocer qué productos en concreto se venden por encima del precio medio para todos los productos de la empresa,
 ya que sospechan que dicho número es demasiado elevado. También quieren que ordenemos los resultados por su precio de mayor a menor.
📌NOTA: para este ejercicio puedes necesitar dos consultas separadas y usar el resultado de la primera para filtrar la segunda.
*/
SELECT COUNT(product_id) AS 'Recuento Art.' , AVG(unit_price) AS 'Media Total'
FROM products;

SELECT product_id
FROM products
WHERE unit_price > 28.87
ORDER BY product_id ASC;


/* Qué productos se han descontinuado:
De cara a estudiar el histórico de la empresa nos piden una consulta para conocer el número de productos que se han descontinuado.
El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.
*/

SELECT *
FROM products;

SELECT COUNT(product_id)
FROM products
WHERE discontinued = 1;

/*Detalles de los productos de la query anterior:
Adicionalmente nos piden detalles de aquellos productos no descontinuados, sobre todo el ProductID y ProductName. 
Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado, 
que serán los más recientes. No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.
*/

SELECT product_id, product_name
FROM products
WHERE discontinued <> 1
ORDER BY product_id DESC
LIMIT 10;

SELECT product_id, product_name
FROM products
WHERE discontinued <> 1
ORDER BY product_id ASC
LIMIT 10
OFFSET 67;

/*Relación entre número de pedidos y máxima carga:
Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos (freight) 
que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).
*/

SELECT *
FROM orders;

SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
GROUP BY employee_id

/* Números de pedidos por día:
El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la distribución de los mismos según las fechas. 
Por lo tanto, tendremos que generar una consulta que nos saque el número de pedidos para cada día, mostrando de manera separada el día (DAY()),
 el mes (MONTH()) y el año (YEAR()). 
*/
 
 SELECT COUNT(order_id)
 FROM ORDERS
 
 SELECT *
 FROM ORDERS
 