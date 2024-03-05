/*
Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en 
ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.
*/

-- COLUMNAS: Ciudad, nombre de la compañia y el nombre de contacto


USE tienda_northwind

SELECT *
FROM customers;

SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';


/*
Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el 
número de total de pedidos que han hecho todas las ciudades que empiezan por "L".
*/

SELECT *
FROM customers;

SELECT *
FROM ORDERS;



/*
Todos los clientes cuyo "contact_title" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". 
Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.
*/

-- Nombre contacto, posición y nombre compañía


SELECT * 
FROM customers;

SELECT contact_title, contact_name, company_name
FROM customers
WHERE contact_title NOT LIKE 'Sales%';


/*
Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.
Los resultados son:
*/

SELECT contact_name
FROM customers
WHERE company_name NOT LIKE '_A%';

/*
Extraer toda la información sobre las compañias que tengamos en la BBDD
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD.
 Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). 
 Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
 Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT.
*/

-- CLIENTES Y PROVEEDORES
-- Ciudad, Nombre de la empresa, nombre de contacto y si es cliente o proveedor.


SELECT 'cliente' AS Relationship, company_name,contact_name,city
FROM customers
UNION
SELECT 'proveedor' AS Relationship, company_name,contact_name,city 
FROM suppliers;


/*
Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet". 
*/

SELECT *
FROM categories;

SELECT *
FROM categories
WHERE description  LIKE '%sweet%';

SELECT *
FROM customers; 

SELECT 'Empleado' AS relationship, CONCAT(first_name,' ',last_name) AS Nombre_Completo
FROM employees
UNION
SELECT 'Cliente' AS relationship, contact_name
FROM customers; 
