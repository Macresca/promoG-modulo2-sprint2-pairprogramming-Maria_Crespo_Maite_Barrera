USE northwind;

/* 1 Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos 
conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
*/
-- Cuantos pedidos ha realizado cada cliente de UK
-- ID cliente, nombre empresa y el número de pedidos.

SELECT * 
FROM customers;

-- CUSTOMER_ID
-- COMPANY_ NAME

SELECT * 
FROM ORDERS;

-- CUSTOMER_ID
-- COUNTRY = 'UK'
-- COUNT(order_id)

SELECT pd.customer_id, cs.company_name, COUNT(order_id) AS Pedidos
FROM ORDERS AS pd
LEFT JOIN customers AS cs
ON pd.customer_id = cs.customer_id
WHERE ship_country = 'UK'
GROUP BY customer_id;

/* 2 Productos pedidos por empresa en UK por año:
Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie 
de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos 
ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad 
de objetos que han pedido. Para ello hará falta hacer 2 joins.
*/

-- Nº productos pedidos por las empresas de UK cada año.
-- Nombre empresa, año, Nº productos.

SELECT *
FROM orders;

-- customer_id
-- Order_date (AÑO)
-- Order_id

SELECT DISTINCT(YEAR(order_date)) AS anyo , customer_id, company_name, SUM(quantity) AS Q 
FROM orders AS pd
NATURAL JOIN order_details AS dt
NATURAL JOIN customers AS cst
WHERE ship_country = 'UK'
GROUP BY YEAR(order_date),customer_id, company_name;

SELECT * 
FROM order_details;

-- order_id
-- quantity

SELECT * 
FROM customers;

-- customer_id
-- company_name

/*
3. Mejorad la query anterior:
Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa 
cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 
15% nos sale como 0.15.
*/

SELECT(YEAR(order_date)) AS anyo, 
				customer_id, 
                company_name, 
                SUM(quantity) AS Q, 
                SUM((unit_price * quantity) * (1-discount)) AS Total
FROM orders AS pd
	INNER JOIN order_details AS dt ON pd.order_id = dt.order_id
	INNER JOIN customers AS cst ON pd.customer_id = cst.customer_id
WHERE ship_country = 'UK'
GROUP BY YEAR(order_date),customer_id, company_name;

/* 4.BONUS: Pedidos que han realizado cada compañía y su fecha:
Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, 
desde la central nos han pedido una consulta que indique el nombre de cada compañia cliente junto con 
cada pedido que han realizado y su fecha.
*/

SELECT order_id, company_name, order_date
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

/*5.BONUS: Tipos de producto vendidos:
Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y 
el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).
Pista Necesitaréis usar 3 joins
*/

SELECT categories.category_id, categories.category_name,products.product_name, ROUND(SUM(order_details.unit_price* order_details.quantity*(1- order_details.discount)),2) AS ProductSales
FROM categories
INNER JOIN products
	ON categories.category_id = products.category_id
INNER JOIN order_details
	ON products.product_id = order_details.product_id
GROUP BY categories.category_id, categories.category_name,products.product_name;

/* 6. Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente,
 los ID de sus pedidos y las fechas.
*/

SELECT orders.order_id, orders.order_date,customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

/* 7. Pedidos por cliente de UK:
Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de 
pedidos que ha realizado cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. 
Especificamente nos piden el nombre de cada compañía cliente junto con el número de pedidos.
*/
SELECT customers.company_name, COUNT(orders.order_id) AS 'Pedido'
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.country = "UK"
GROUP BY company_name;

/* 8. Empresas de UK y sus pedidos:
También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) 
junto con los ID de todos los pedidos que han realizado y la fecha del pedido.
*/

SELECT company_name, order_id, order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = 'UK';

/* 9. Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. 
Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?
*/

SELECT 	E.city AS 'Ciudad_ Empleado', 
		E.first_name AS 'Nombre_Empleado', 
        E.last_name AS 'Apellido_Empleado', 
        M.city AS 'Ciudad_ Manager', 
        M.first_name AS 'Nombre_Manager', 
        M.last_name AS 'Apellido_Manager'
FROM employees AS E
JOIN employees AS M
	ON E.title NOT LIKE M.title
WHERE M.title LIKE '%Manager%';
