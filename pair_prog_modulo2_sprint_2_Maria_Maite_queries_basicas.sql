CREATE SCHEMA NORTHWIND;
USE NORTHWIND
-- ejercicio 4

SELECT employee_id, last_name, first_name
FROM employees;

-- ejercicio 5
SELECT product_name, product_id, category_id, unit_price, discontinued
FROM products
WHERE unit_price BETWEEN 0 AND 5;

-- ejercicio 6
SELECT *
FROM products;

-- ejercicio 7
SELECT product_id, product_name,unit_price
FROM products
WHERE product_id < 10 AND unit_price < 15;

-- ejercicio 8

SELECT product_id, product_name, unit_price
FROM products
WHERE NOT product_id < 10 AND unit_price < 15;

-- ejercicio 9

SELECT DISTINCT ship_country
FROM orders;







