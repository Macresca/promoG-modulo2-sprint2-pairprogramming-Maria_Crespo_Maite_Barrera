USE tienda_northwind;

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

/* Productos pedidos por empresa en UK por año:
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