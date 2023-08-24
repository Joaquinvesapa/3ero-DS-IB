CREATE DATABASE empresa_empleados 

create table secciones(
  codigo integer(2),
  nombre varchar(20),
  sueldo decimal(7,2),
  primary key (codigo)
 );


 create table empleados(
  legajo integer(5),
  documento char(8),
  sexo char(1),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion integer(2) not null,
  cantidadhijos integer(2),
  estadocivil char(10),
  fechaingreso date,
  primary key (legajo),
  foreign key (seccion) references secciones(codigo)
  );


insert into secciones values(1,'Administracion',300);
 insert into secciones values(2,'Contaduría',400);
 insert into secciones values(3,'Sistemas',500);

 insert into empleados values(100,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','2010/10/10');
 insert into empleados values(102,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','2011/01/03’');
 insert into empleados values(103,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998/07/02');
 insert into empleados values(104,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','2008/10/10');
 insert into empleados values(105,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000/05/09');


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

--  1 - Crear una vista que muestre apellido,nombre, documento, domicilio, sexo y  cantidad de hijos de los empleados ordenados por apellido

CREATE VIEW v_empleados AS
SELECT e.apellido AS Apellido,
       e.nombre AS Nombre,
       e.sexo as Sexo ,
       e.domicilio As Domicilio,
       e.cantidadhijos AS Cantidad_Hijos
FROM empleados e
ORDER BY e.apellido

--  2 - De la vista anterior crear otra vista que solo guarde los datos de los empleados que tengan al menos un hijo

 CREATE VIEW v_empleados_con_hijos AS
SELECT e.apellido AS Apellido,
       e.nombre AS Nombre,
       e.sexo as Sexo ,
       e.domicilio As Domicilio,
       e.cantidadhijos AS Cantidad_Hijos
FROM empleados e
WHERE e.cantidadhijos => 1
ORDER BY e.apellido

-- 3 - Crear una vista que muestre el nombre de los empleados, sexo, nombre de las secciones y cantidad de hijos. Mostrarla.

CREATE VIEW v_empleados_secciones AS
SELECT e.nombre AS Nombre,
       e.sexo AS Sexo,
       s.nombre AS Seccion,
       e.cantidadhijos As Cantidad_Hijos
FROM empleados e
INNER JOIN secciones s ON e.seccion = s.codigo;

SELECT * FROM v_empleados_secciones

-- 4- Usando la vista creada, mostrar el nombre de la sección y la cantidad de empleados de cada una en ellas

SELECT Seccion,
       COUNT(*)
FROM v_empleados_secciones
GROUP BY Seccion

-- 5 -Crear una vista que guarde el año y la cantidad de empleados que ingresaron ese año
CREATE VIEW v_epleados_año AS
SELECT YEAR(fechaingreso) AS Año,
       COUNT(*) AS Cant_Empleados
FROM empleados
GROUP BY Año

-- 6 - Crear una vista con los datos personales de los empleados que tienen hijos
CREATE VIEW v_empleados_hijos_6 as
SELECT 
 e.legajo As Legajo, 
 e.nombre As Nombre,
 e.apellido As Apellido,
 e.documento As Documento, 
 e.sexo As Sexo,
 e.domicilio AS Domicilio,
 e.cantidadhijos As Cantidad_Hijos,
 e.estadocivil AS Estado_civil 
FROM empleados e
WHERE e.cantidadhijos >0

--  7 - 
  -- A - Crear una vista con los datos de las secciones.
  CREATE VIEW v_secciones AS
  SELECT s.codigo AS Codigo,
         s.nombre AS Nombre,
         s.sueldo As Sueldo
  FROM secciones s 

  -- B - Agregar a la vista los datos de una nueva sección número 4, nombre ingeniería, sueldo $500. 
 INSERT INTO v_secciones VALUES(4,'Ingeniería',500);
  
  -- C- Qué sucedió en la tabla secciones?
  En la tabla secciones de agrego el nuevo registro.


-- 8 - Modificar el sueldo agregado a la vista anterior asignándole $800. Que sucede en la tabla
UPDATE v_secciones SET Sueldo = Sueldo+800 WHERE Codigo = 4

En la tabla y en la vista el sueldo se modifico

--9 - Modificar el sueldo de la tabla secciones del código 1 a $900 de sueldo. Qué sucede con la vista?
UPDATE secciones SET Sueldo = 900 WHERE Codigo = 1

En la vista el sueldo se ve actualizado
 
-- 10 - Mostrar la vista sumandole a los sueldos 100$
SELECT v_secciones.Sueldo + 100 as Sueldo,
	   v_secciones.Codigo,
	   v_secciones.Nombre
FROM v_secciones