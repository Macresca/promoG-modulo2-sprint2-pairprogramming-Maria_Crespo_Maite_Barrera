
/* 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada.
*/

SELECT `order_id`, `customer_id`, `employee_id`, `order_date`, `required_date`
	FROM `orders` AS `o1`
    WHERE `order_date` IN (SELECT MAX(`order_date`)
									FROM `orders` AS `o2`
                                    WHERE  `o1`.`employee_id`= `o2`.`employee_id`);

/* 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. 
De nuevo lo tendréis que hacer con queries correlacionadas.
*/

SELECT `od1`.`product_id`, `od1`.`unit_price` AS "Maxunitprice"
	FROM `order_details` AS `od1`
    WHERE `od1`.`unit_price` IN (SELECT MAX(`od2`.`unit_price`)
					FROM `order_details` AS `od2`
					WHERE `od1`.`product_id` = `od2`.`product_id`)
GROUP BY `od1`.`product_id`,`od1`.`unit_price`;


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
 
 
 /* 6. Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.
*/

SELECT O1.product_name, O1.unit_price
FROM products AS O1
WHERE O1.unit_price IN (
    SELECT O2.unit_price
    FROM products AS O2
    WHERE O1.product_id = O2.product_id)
LIMIT 10;
 
