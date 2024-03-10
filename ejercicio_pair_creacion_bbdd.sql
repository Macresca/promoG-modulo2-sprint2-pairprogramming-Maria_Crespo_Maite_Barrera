CREATE SCHEMA `tienda_zapatillas`;
CREATE TABLE tabla_zapatillas (
id_zapatillas INT NOT NULL AUTO_INCREMENT,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY (id_zapatillas));

CREATE TABLE tabla_cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
numero_telefono INT NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45) NOT NULL,
provincia VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL,
PRIMARY KEY (id_cliente)
);

CREATE TABLE tabla_empleados (
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado)
);

CREATE TABLE tabla_facturas (
id_factura INT NOT NULL AUTO_INCREMENT,
numero_factura VARCHAR(45) NOT NULL,
fecha DATE NOT NULL,
id_zapatillas INT NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
PRIMARY KEY (id_factura),
CONSTRAINT  `fk_tabla_zapatillas_tabla_cliente_tabla_empleado`
	FOREIGN KEY (id_zapatillas) REFERENCES tabla_zapatillas(id_zapatillas),
	FOREIGN KEY (id_cliente) REFERENCES tabla_cliente(id_cliente),
	FOREIGN KEY (id_empleado) REFERENCES tabla_empleados(id_empleado)
);