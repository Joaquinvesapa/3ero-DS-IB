--  1 - Crear un procedimiento almacenado que ingresando dos números, nos devuelva el promedio de ambos.
DELIMITER $$
CREATE PROCEDURE sp_promedios_2_numeros(
  IN num1 int,
  IN num2 int
)
BEGIN
	SELECT (num1+num2)/2;
END $$
DELIMITER ;

-- 2 - Crear un procedimiento almacenado que reciba un parámetro de entrada/salida con un entero y lo retorne incrementado en 1:

DELIMITER $$
CREATE PROCEDURE sp_incrementar_numero(
  IN numIn int,
  OUt numOut int
)
BEGIN
	SELECT numIn+1
    INTO numOut;
END $$
DELIMITER ;

CALL sp_incrementar_numero(1, @Num);

SELECT @Num;

-- 3 - Confeccionemos un procedimiento almacenado que reciba dos enteros, 	y seguidamente ejecute el comando select para recuperar el contenido de dicha variable local:
DELIMITER $$
CREATE PROCEDURE sp_Mostrar_Enteros(
  IN num1 int,
  IN num2 int
)
BEGIN
  SELECT num1, num2;
END $$
DELIMITER ;


CALL sp_Mostrar_Enteros(1, 2);


-- 4- Crear un procedimiento almacenado que muestre el mayor de 2 enteros que le pasamos como parámetro(Usar If):

DELIMITER $$
CREATE PROCEDURE sp_mostrar_mayor(
  IN num1 int,
  IN num2 int
)
BEGIN 
  SELECT IF(num1>num2, num1, num2) As Mayor;
END $$
DELIMITER ;

CALL sp_mostrar_mayor(3, 50)
CALL sp_mostrar_mayor(40, 2)


-- 5 - Crear un procedimiento almacenado que muestre el mayor de 3 enteros(Usar If):

DELIMITER $$
CREATE PROCEDURE sp_mayor_entre_3(
  IN num1 int,
  IN num2 int,
  IN num3 int
)
BEGIN 
  SELECT IF(num1 > num2, IF(num1 > num3, num1, num3), IF(num2 >num3, num2, num3))As Mayor;
END $$
DELIMITER ;

CALL sp_mayor_entre_3(1, 2, 3); --> 3
CALL sp_mayor_entre_3(1, 5, 3); --> 5
CALL sp_mayor_entre_3(10, 2, 3); --> 10


-- 6 - Confeccionar un procedimiento almacenado que le enviemos un entero comprendido entre 1 y 3. El segundo parámetro debe retornar el tipo de medalla que representa dicho número, sabiendo que (Usar Case): Si es 1 muestra “Oro”, si es 2 muestra “plata” y si es 3, muestra “BRonce”

DELIMITER $$
CREATE PROCEDURE sp_mostrar_medalla(
  IN entero int
)
SET @Error = null
BEGIN
    SELECT CASE WHEN entero = 1 THEN 'Oro' 
                WHEN entero = 2 THEN 'Plata' 
                ELSE 'Bronce' 
            END as Medalla;
END
DELIMITER ;

-- 7 - Crear la siguientes tabla

create table libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',15);
 insert into libros (titulo,autor,editorial,precio)
  values ('Ilusiones','Richard Bach','Planeta',12);
 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio)
  values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
 insert into libros (titulo,autor,editorial,precio)
  values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros (titulo,autor,editorial,precio)
  values ('Puente al infinito','Bach Richard','Sudamericana',14);
 insert into libros (titulo,autor,editorial,precio)
  values ('Antología','J. L. Borges','Paidos',24);
 insert into libros (titulo,autor,editorial,precio)
  values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
 insert into libros (titulo,autor,editorial,precio)
  values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

-- 9 - Crear procedimiento que muestre la cantidad de libros que hay en la bd
DELIMITER $$
CREATE PROCEDURE sp_cantidad_libros()
BEGIN
  SELECT COUNT(*) As Cantidad_de_Libros FROM libros; 
END $$
DELIMITER ;

CALL sp_cantidad_libros()

-- 10 - Crear procedimiento que muestre la cantidad de libros de la editorial X que hay en la bd.(Pasarle el nombre de una editorial)
DELIMITER $$
CREATE PROCEDURE sp_Libros_por_editorial(
  IN NombreEditorial varchar(20)
)
BEGIN
  SELECT l.editorial As Editorial,
         COUNT(*) As Cantidad_de_Libros
    FROM libros l
  WHERE l.editorial = NombreEditorial;
END $$
DELIMITER ;

-- 11 - Recorrer la tabla y buscar la cantidad de veces que aparecen libros del Editorial X, mostrar 0 sino encuentra ninguno, 1 si encuentra 1 y 2 si encuentra más de 1.(no usar Count)
DELIMITER $$
CREATE PROCEDURE sp_cantidad_libros_editorial(
  IN NombreEditorial varchar(20)
)
BEGIN
SELECT
  NombreEditorial,
  CASE 
        WHEN (SELECT MAX(codigo) FROM libros WHERE editorial = NombreEditorial) IS NOT NULL THEN
            CASE 
                WHEN (SELECT MAX(codigo) FROM libros WHERE editorial = NombreEditorial LIMIT 2) IS NOT NULL THEN 2
                ELSE 1
            END
        ELSE 0
    END As Cantidad_De_Libros;
END $$
DELIMITER ;
 
-- 12 - Crear un stored procedure que recibe el nombre de una editorial y luego aumente en un 10% los precios de los libros de tal editorial:
DELIMITE $$
CREATE PROCEDURE aumentar_precios_x_editorial(
  IN NombreEditorial varchar(20)
)
BEGIN
  UPDATE libros 
     SET precio = precio + precio * 0.1
   WHERE libros.editorial = NombreEditorial;
END $$
DELIMITER ;

CALL sp_aumentar_precios_x_editorial('Planeta')

-- 13 - Crear un procedimiento que recibe 2 parámetros, el nombre de una editorial y el valor de incremento:

DELIMITER $$
CREATE PROCEDURE sp_aumentar_precios_editorial_incremento(
  IN NombreEditorial varchar(20),
  IN Incremento int
)
BEGIN
  UPDATE libros 
     SET precio = precio + Incremento
   WHERE libros.editorial = NombreEditorial;
END $$
DELIMITER ;


-- 14 - Crear un procedimiento almacenado que ingrese un nuevo libro en la tabla "libros":

DELIMITER $$
CREATE PROCEDURE sp_insertar_nuevo_libro(
  IN Titulo varchar(40),
  IN Autor varchar(30),
  IN Editorial varchar(20),
  IN Precio decimal(5,2)
)
BEGIN
  INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES (Titulo,Autor,Editorial,Precio);
END $$
DELIMITER ;


-- 15 - Crear un procedimiento almacenado que recibe el nombre de un autor  y nos retorna la suma de precios de todos sus libros y su promedio
DELIMITER $$
CREATE PROCEDURE sp_total_precios_x_autor(
  IN Autor varchar(30)
)
BEGIN
  SELECT l.autor AS Autor,
         ROUND(SUM(l.precio)) AS Total_Precios,
         ROUND(AVG(l.precio)) AS Promedio_Precios
    FROM libros l
   WHERE l.autor = Autor
GROUP BY l.autor;
END $$
DELIMITER ;