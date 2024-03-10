/*
3. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.
*/
SELECT *
FROM categories;
SELECT product_id,product_name,category_id
FROM products
WHERE category_id IN (SELECT category_id
					  FROM categories
                      WHERE category_name = 'Beverages')

/*4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.
*/

SELECT DISTINCT country
FROM customers
WHERE country NOT IN ( SELECT DISTINCT country
						FROM suppliers);


/* 5.Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" 
(ProductID 6) en un solo pedido.*/
                        
 SELECT customer_id, order_id
 FROM orders
 WHERE order_id IN (SELECT order_id
 FROM order_details
 WHERE product_id = 6 AND quantity >20);
 
 
 
 
 
 
 
