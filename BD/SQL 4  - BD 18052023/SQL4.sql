CREATE DATABASE SQL4

CREATE TABLE gamas(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60)
)

CREATE TABLE productos(
    id VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60),
    dimensiones int,
    precio_venta decimal(6,3),
    gama_id int,
    FOREIGN KEY (gama_id) REFERENCES gamas(id)
)
CREATE TABLE oficinas(
    id varchar(7) PRIMARY KEY,
    ciudad varchar(50),
    domicilio varchar(40),
    telefono varchar(20)
)
CREATE TABLE empleados(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60),
    telefono varchar(20),
    direccion varchar(50),
    ciudad varchar(20),
    oficina_id varchar(7),
    jefe_id int,
    FOREIGN KEY (oficina_id) REFERENCES oficinas(id),
    FOREIGN KEY (jefe_id) REFERENCES empleados(id)
)
CREATE TABLE clientes(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(30),
    telefono varchar(20),
    direccion varchar(50),
    ciudad varchar(20),
    limite_credito decimal(6,2)
)
CREATE TABLE compras(
    id int PRIMARY KEY AUTO_INCREMENT,
    cliente_id int,
    empleado_id int,
    fecha date,
    estado varchar(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
)
CREATE TABLE copra_productos(
    id int PRIMARY KEY AUTO_INCREMENT,
    compra_id in,
    producto_id VARCHAR(30),
    precio_unidad decimal(6,2),
    numero_linea int,
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
)

---------------------------------------------------------------------
---------------------------------------------------------------------

INSERT INTO oficinas VALUES ('BCN-ROS','Rosario','341235242','Mitre 333'),('BCN-FUN','Funes','34111111','San Juan 514'),('BCN-PER','Perez','34122222','Pelegrini 514'), ('BCN-ROL','Roldan','3412345667','San Martin 1514');

INSERT INTO empleados VALUES (1,'Marcos Perez','3413897','San Juan 514', 'Rosario','BCN-ROS',NULL),
 (2,'Juan Andes','341353421','San Martin 1514', 'Rosario','BCN-ROS',1),
  (3,'Mariana Papalao','341223344','Entre Rios 222', 'Rosario','BCN-ROS',1), 
  (4,'Daniel Dartes','341223322','San Juan 111', 'Funes','BCN-FUN',1),
  (5,'Mariana Paris','341444444','Entre Rios 1222', 'Funes','BCN-FUN',3), 
  (6,'Daniel Mariani','341223322','San Juan 11', 'Roldan','BCN-ROL',3),
   (7,'Juana Juarez','341223322','Sarmiento  2211', 'Roldan','BCN-ROL',3);

INSERT INTO gama VALUES ('10','Plantas para jardin decorativas'), ('20','Herramientas para todo tipo de acción'),('30','Plantas aromáticas'),('40','Árboles pequeños de producción frutal');

INSERT INTO clientes VALUES (1,'Daniel G','5556901745','False Street 52 2 A','San Francisco',3000),(2,'Anne Wright','5557410345','Wall-e Avenue 34','USA',19.60),(3,'Gerudo Valley','5552323129','Oaks Avenue nº22','USA',22.10),(4,'Juan Perez','5552323129','San juan nº22','Rosario',234.85),(5,'David Serrano','675598001','Azores 321','Funes',11.50),(6,'Jose Tacaño','655983045','Fuentes 6252','Rosario',11.20),(7,'Antonio Lasas','34916540145','Mitre 543','Funes',8.15),(8,'Akane Tendo','55591233210','Null Street nº69','USA',696.60);

INSERT INTO compras VALUES (1,'2006-01-17','Entregado',2,1), (2,'2007-10-26','Entregado',2,5),(3,'2008-06-25','Rechazado',1,3), (4,'2009-01-26','Pendiente',3,1), (8,'2008-11-14','Entregado',3,2), (9,'2008-12-27','Entregado',4,1), (10,'2009-01-15','Pendiente',4,2), (11,'2009-01-20','Pendiente',3,1);

INSERT INTO productos VALUES ('11679','Sierra de Poda 400MM',20,'0,258',1500.15),('21636','Pala',20,'0,156',125.50),('22225','Rastrillo de Jardín',20,'1,064',590), ('AR-001','Ajedrea',40,'15,20',530.50), ('AR-002','Lavándula Dentata',30,'15,20',550), ('AR-008','Thymus Citriodra (Tomillo limón)',30,'1,064', 890.50), ('FR-100','Nectarina',40,'8,10',1000.60), ('FR-16','Calamondin Copa EXTRA Con FRUTA',40,'10,120',990)

INSERT INTO compraproductos  VALUES (1,'11679', 10, 5,70.3,1), (2,'22225', 10, 3,70.3,2), (3,'21636',10,40,43.50,3),(4,'11679', 8, 5,76.3,1),(5,'21636', 8, 5,70.3,2), (6,'11679', 3, 5,70.3,1), (7,'FR-100', 3, 5,78.3,2), (8,'AR-008', 3, 5,70.3,3),(9,'AR-008', 1, 5,170.3,1),(10,'11679', 1, 5,90.3,2);

---------------------------------------------------------------------
---------------------------------------------------------------------

-- 1.Devuelve un listado con el código de oficina y la ciudad de la misma. 
SELECT of.id, of.ciudad from oficinas 

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de Rosario. 
SELECT ciudad, telefono FROM oficinas WHERE ciudad = 'Rosario'
-- 3. Devuelve un listado con el nombre y telefono de los empleados cuyo jefe tiene un código de jefe igual a 1. 
SELECT nombre, telefono FROM empleado WHERE jefe_id = 1

-- 4. Devuelve un listado con el nombre de los todos los clientes rosarinos.
SELECTE nombre FROM clientes WHERE ciudad = 'Rosario'

-- 5. Devuelve un listado con el nombre de los todos los clientes cuyo límite de crédito esta entre 10 y 300.
SELECT nombre FROM clientes WHERE limite_credito BETWEEN 10 and 300

-- 6. Mostrar los pedidos hechos en el  2008. 
SELECT * FROM compras WHERE YEAR(fecha) = '2008'

-- 7. Devuelve un listado con el código de pedido, nombre del cliente y fecha del pedido. (usar Join)
SELECT id, clientes.nombre, fecha FROM compras
INNER JOIN clientes ON clientes.id = compras.cliente_id

-- 8.Mostrar los nombres de los  clientes que no realizaron compras
SELECT ID, nombre FROM clientes WHERE id NOT IN (SELECT cliente_id FROM compras GROUP BY cliente_id);

-- 9. Devuelve un listado con el código de pedido, nombre del cliente, nombre del empleado  y fecha del pedido
SELECT compras.id, clientes.nombre, empleados.nombre, compras.fecha
FROM compras
INNER JOIN empleados ON empleados.id = compras.empleado_id
INNER JOIN clientes ON clientes.id = compras.cliente_id

-- 10.  Devuelve un listado con el código de pedido, nombre del cliente, nombre del empleado  y fecha del pedido de los pedidos pendientes
