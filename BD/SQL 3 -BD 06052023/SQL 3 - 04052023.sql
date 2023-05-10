--EJECUTAR EN ESTE MISMO ORDEN 
CREATE TABLE CLIENTES 
(
ID	     INT NOT NULL PRIMARY KEY,
NOMBRE   CHAR(100),
APELLIDO CHAR(100),
DNI		 CHAR(20),
CORREO	 CHAR(100)
);
CREATE TABLE PROVEEDORES
(IDPROV INT NOT NULL PRIMARY KEY,
NOMBRE   CHAR(100));


CREATE TABLE PRODUCTOS
(
ID INT  NOT NULL PRIMARY KEY,
CODIGO	 CHAR(30),
NOMBRE	 CHAR(100),
DESCRIPCION CHAR(150),
IDPROV INT NOT NULL,
FOREIGN KEY (IDPROV ) REFERENCES PROVEEDORES(IDPROV )
);
CREATE TABLE VENTAS
(
ID	     INT NOT NULL PRIMARY KEY,
CLIENTEID INT NOT NULL,
FECHA DATETIME,
TOTAL INT,
 FOREIGN KEY (CLIENTEID) REFERENCES CLIENTES(ID)
);

CREATE TABLE VENTAS_DETALLE
(
ID	     INT  NOT NULL PRIMARY KEY,
VENTA_ID INT NOT NULL,
PRODUCTOID INT NOT NULL,
CANTIDAD INT,
FOREIGN KEY (VENTA_ID) REFERENCES VENTAS(ID),
     FOREIGN KEY (PRODUCTOID) REFERENCES PRODUCTOS(ID)
);

------INSERT----
INSERT INTO CLIENTES (ID,NOMBRE, APELLIDO, DNI, CORREO)
VALUES (1,'JUAN','PEREZ','09876541230','juanperez@correo.com'),
(2,'DIEGO','RUIZ','09658741236','diegoruiz@correo.com'),
(3,'SUSANA','SOUSA','09876541230','susana@correo.com'),
(4,'JUANA','CLARENCE','09876541230','juana@correo.com'),
(5,'SOFIA','ALVARADO','09876541230','sofia@correo.com');

INSERT INTO proveedores (IDPROV,NOMBRE)
VALUES (1,'JUAN PEREZ'),
(2,'ROBERTO GONZALEZ');


INSERT INTO VENTAS(ID, CLIENTEID, FECHA, TOTAL)
VALUES(1, 1,"2021/02/05",500),
(2,1,"2021/02/05",500),
(3,2,"2021/03/05",300),
(4,3,"2021/03/05",800),
(5,2,"2021/06/05",700),
(6,1,"2021/07/05",100),
(7,2,"2021/07/05",260),
(8,4,"2021/08/05",350);

INSERT INTO PRODUCTOS (ID, CODIGO, NOMBRE, DESCRIPCION,IDPROV)
VALUES(1,'AB-0001','MOUSE WIRELESS','UNO DE LOS MEJORES MOUSE WIRELESS',1),
(2,'CD-0002','TECLADO WIRELESS','UNO DE LOS MEJORES TECLADOS WIRELESS',1),
(3,'FG-0003','PARLANTES ','UNO DE LOS MEJORES PARLANTES DEL MERCADO',2),
(4,'HI-0004','MONITOR GAMER','UNO DE LOS MEJORES MONITORES GAMER',2),
(5,'JK-0005','CPU GAMER','UNO DE LOS MEJORES CPU GAMER',1);

INSERT INTO VENTAS_DETALLE(ID,VENTA_ID,PRODUCTOID,CANTIDAD)
VALUES(1,1,1,5),
(2,1,2,4),
(3,1,3,3),
(4,1,1,5),
(5,2,2,1),
(6,2,3,8),
(7,3,2,10),
(8,3,1,11),
(9,4,1,10),
(10,1,1,1);


------- EJERCICIOS -------

--2 - Mostrar todas las ventas, dejando ver el id de la venta, la fecha y el nombre del cliente. 
--Hacerlo sin usar Join/Usar inner Join/Usar right join/Usar left join

SELECT id, fecha, clientes.nombre FROM ventas, clientes where cliente.id = ventas.clienteid

SELECT ventas.id,
	   ventas.fecha,
	   c.nombre 
FROM ventas
INNER JOIN clientes c ON c.id = ventas.clienteid

SELECT ventas.id,
	   ventas.fecha,
	   c.nombre 
FROM ventas
RIGHT JOIN clientes c ON c.id = ventas.clienteid

-- 2 - Mostrar todas las ventas, dejando ver el id de la venta, la fecha y el nombre del
-- cliente. Hacerlo sin usar Join/Usar inner Join/Usar Right Join/Usar left Join


SELECT v.ID, v.FECHA, c.NOMBRE
FROM VENTAS v, CLIENTES c
WHERE v.CLIENTEID = c.ID

SELECT VENTAS.ID, 
       VENTAS.FECHA, 
       CLIENTES.NOMBRE 
FROM VENTAS
INNER JOIN CLIENTES ON VENTAS.CLIENTEID = CLIENTES.ID

SELECT VENTAS.ID,
       VENTAS.FECHA,
       CLIENTES.NOMBRE
FROM VENTAS
RIGHT JOIN CLIENTES ON VENTAS.CLIENTEID = CLIENTES.ID

SELECT VENTAS.ID,
       VENTAS.FECHA,
       CLIENTES.NOMBRE
FROM VENTAS
LEFT JOIN CLIENTES ON VENTAS.CLIENTEID = CLIENTES.ID


-- 3 - Agregar el proveedor número 3 que se llama Natalia Perez.
-- Agregar dos productos nuevos, (6,'RR-0006','CPU','UNO DE LOS MEJORES CPU
-- GAMER',1),(7,'TT-0007','teclado','UNO DE LOS MEJORES TECLADOS',2) ;

INSERT INTO PROVEEDORES (IDPROV, NOMBRE) VALUES (3, 'Natalia Perez')

INSERT INTO PRODUCTOS (ID, CODIGO, NOMBRE, DESCRIPCION,IDPROV)
VALUES (6,'RR-0006','CPU','UNO DE LOS MEJORES CPU -- GAMER',1),
       (7,'TT-0007','teclado','UNO DE LOS MEJORES TECLADOS',2) 

-- 4- Mostrar todos los productos con su nombre y el nombre del proveedor, solo
-- mostrar los productos que solo tengan proveedores

SELECT PRODUCTOS.NOMBRE,
       PROVEEDORES.NOMBRE 
FROM PRODUCTOS
INNER JOIN PROVEEDORES ON PRODUCTOS.IDPROV = PROVEEDORES.IDPROV


-- 5- Mostrar los nombres de todos los proveedores junto a los nombres de los
-- productos que proveen cada uno

SELECT PROVEEDORES.NOMBRE, PRODUCTOS.NOMBRE
FROM PROVEEDORES
RIGHT	JOIN PRODUCTOS ON PRODUCTOS.IDPROV = PROVEEDORES.IDPROV

SELECT  PROVEEDORES.NOMBRE, PRODUCTOS.NOMBRE
FROM PRODUCTOS
LEFT JOIN PROVEEDORES ON PROVEEDORES.IDPROV = PRODUCTOS.IDPROV

-- 6- Mostrar los nombres de todos los proveedores y la cantidad de productos que
-- proveen cada uno

SELECT PROVEEDORES.NOMBRE, COUNT(PRODUCTOS.ID) AS cant_prov
FROM PROVEEDORES
INNER JOIN PRODUCTOS ON PRODUCTOS.IDPROV = PROVEEDORES.IDPROV
GROUP BY PROVEEDORES.NOMBRE

-- 7 - Mostrar por producto, la cantidad total que se vendió en el total de ventas (aún
-- los que no se vendieron).

SELECT PRODUCTOS.NOMBRE, SUM(VENTAS_DETALLE.CANTIDAD)
FROM PRODUCTOS
LEFT JOIN VENTAS_DETALLE ON VENTAS_DETALLE.PRODUCTOID = PRODUCTOS.ID
GROUP BY PRODUCTOS.ID

-- 8 - Detalle de cada una de las ventas (cuantos y que productos fueron registrados
-- en cada venta)

SELECT VENTAS.ID, PRODUCTOS.NOMBRE, VENTAS_DETALLE.CANTIDAD
FROM VENTAS
INNER JOIN VENTAS_DETALLE ON VENTAS.ID = VENTAS_DETALLE.VENTA_ID
INNER JOIN PRODUCTOS ON VENTAS_DETALLE.PRODUCTOID = PRODUCTOS.ID
GROUP BY PRODUCTOS.NOMBRE


-- 9 - Guardar en una variable el promedio de los totales de ventas. Mostrar aquellas
-- ventas que son mayores al promedio, se debe ver el id de la venta, fecha y nombre
-- del cliente (usar Join).

SET @avgtotal = (SELECT AVG(ventas.total) FROM ventas);

SELECT 	ventas.id, 
		ventas.FECHA, 
        clientes.NOMBRE
from ventas
INNER JOIN clientes ON clientes.ID = ventas.CLIENTEID
WHERE ventas.TOTAL > @avgtotal --SELECT AVG(ventas.total) from ventas

-- 9a - Mostrar el id y fecha de aquella venta cuyo total el mayor. hacerlo con variable y luego con subconsulta

--Variable

SET @mayor = (SELECT MAX(total) FROM ventas);
SELECT id, fecha FROM ventas WHERE total = @mayor

--Subconsulta

SELECT id, fecha FROM ventas WHERE total = (SELECT MAX(total) FROM ventas)

--10 - Realizar la consulta anterior usando subconsulta

SELECT 	ventas.id, 
		ventas.FECHA, 
        clientes.NOMBRE
from ventas
INNER JOIN clientes ON clientes.ID = ventas.CLIENTEID
WHERE ventas.TOTAL > (SELECT AVG(ventas.total) from ventas)
