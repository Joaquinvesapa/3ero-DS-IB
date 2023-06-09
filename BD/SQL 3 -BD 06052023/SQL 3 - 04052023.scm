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
DESCRIPCION CHAR(150)
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