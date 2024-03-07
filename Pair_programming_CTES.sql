USE tienda_northwind

/*
1.Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.

*/


WITH `info_cliente` 
AS (SELECT `customer_id`, `company_name`
FROM `customers`);


/*
2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, 
pero solo queremos los que pertezcan a "Germany".
*/

WITH `Clientes_Alemania`
AS (SELECT customer_id,company_name
	FROM customers
	WHERE country = 'Germany');

/*
3.Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).
*/

-- customer_id _ Customers, Orders
-- company_name _ Customers
-- id_factura_ Orders
-- Fecha factura_ Orders


WITH `clientes`
AS (SELECT `customer_id`,`company_name`
FROM customers)
				SELECT `order_id`,`orders`.`customer_id`,`order_date`,`company_name`
					FROM orders
					INNER JOIN `clientes`
					ON orders.customer_id = clientes.customer_id;

/*
4. Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.
*/

WITH `clientes`
AS (SELECT `customer_id`,`company_name`
FROM customers)
				SELECT COUNT(`order_id`) AS 'Num_facturas',`orders`.`customer_id`,`company_name`
					FROM orders
                    INNER JOIN `clientes`
                    ON orders.customer_id = clientes.customer_id
                    GROUP BY `orders`.`customer_id`,`company_name`;
					
/*
5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.
*/	

SELECT *
FROM order_details;

WITH `Sum_cantidades`
AS (SELECT product_id, AVG(quantity) AS `Media_Q`
	FROM order_details
	GROUP BY product_id)		
						SELECT `product_name`, `Media_Q`
                        FROM products
                        INNER JOIN sum_cantidades
                        ON sum_cantidades.product_id = products.product_id;
                   
/*
Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
*/

-- Nombre categoría
-- Precio medio (AVG)
-- Precio_MAX (MAX)
-- Precio_MIN (MIN)

SELECT category_name, category_id
FROM categories;

SELECT *
FROM products;

WITH `calculos` 
				AS(SELECT products.category_id, 
							ROUND(AVG(unit_price),2) AS 'Media', 
                            MAX(unit_price) AS 'MAX', 
                            MIN(unit_price) AS 'MIN'
				FROM products
				GROUP BY products.category_id)
												SELECT category_name, Media, MAX, MIN
												FROM categories
												INNER JOIN calculos
												ON calculos.category_id = categories.category_id
                

