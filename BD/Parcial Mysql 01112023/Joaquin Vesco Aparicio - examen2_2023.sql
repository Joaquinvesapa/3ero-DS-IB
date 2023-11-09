-- 1. Devuelve un listado de los empleados cuyo puesto es “Representante de ventas”, mostrando nombre y apellido del empleado, código de oficina y ciudad donde se encuentra la misma.
SELECT
    e.nombre as Nombre,
    e.apellido1 as Apellido_1,
    e.apellido2 as Apellido_2,
    e.codigo_oficina as Codigo_Oficina,
    o.ciudad as Ciudad
FROM empleado e
LEFT JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE e.puesto like "%Representante ventas%";

-- 2. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
SELECT * 
FROM pago p
RIGHT JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
WHERE YEAR(p.fecha_pago) = '2008'
GROUP BY p.codigo_cliente


-- 3. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo y se han rechazado.
SELECT
    p.codigo_pedido as Codigo_Pedido,
    p.codigo_cliente as Codigo_Cliente,
    p.fecha_esperada as Fecha_Esperada,
    p.fecha_entrega as Fecha_Entrega
FROM pedido p 
WHERE p.fecha_entrega > p.fecha_esperada
    OR estado like '%rechazado%'

-- 4. Devuelve un listado que muestre el nombre de cada empleados y el nombre de su jefe
SELECT
    e.nombre As Nombre_Empleado,
    j.nombre As Nombre_Jefe
FROM empleado e
INNER JOIN empleado j ON j.codigo_empleado = e.codigo_jefe

-- 5. Devuelve la descripción de la gama de los productos y la cantidad de productos que hay de cada uno
SELECT 
	g.gama,
    g.descripcion_texto as Descripcion_texto,
    SUM(p.cantidad_en_stock) as Cantidad
FROM gama_producto g
LEFT JOIN producto p ON g.gama = p.gama
GROUP BY g.descripcion_texto


-- 6. Mostrar quien es el cliente que compró último. Tener en cuenta que hay que buscar la última pedido realizada. (usar subconsultas y join)
SELECT c.nombre_cliente
FROM pedido
INNER JOIN cliente c ON c.codigo_cliente = pedido.codigo_cliente
ORDER BY fecha_pedido desc
LIMIT 1



-- 7. Crear un stored procedure que recibe la gama X y luego aumente en un 10% los precios de venta de los productos que son de esa gama(mostrar nombre del producto, gama, y precio de venta del producto antes de la ejecución del procedimiento y luego después de la ejecución )


DELIMITER //
CREATE PROCEDURE sp_aumentar_precio_venta(
    IN Nombre_gama varchar(50)
)
BEGIN
    UPDATE producto SET precio_venta = precio_venta + (precio_venta * 0.10) WHERE gama = Nombre_gama;
END
//
DELIMITER ;


SELECT nombre, gama, precio_venta
FROM producto 
WHERE gama = '';

CALL sp_aumentar_precio_venta('');

SELECT nombre, gama, precio_venta
FROM producto 
WHERE gama = ''


-- 8. Crear un trigger que antes de guardar una nueva gama, convierta los datos a mayuscuclas(gama: descripcion_HTML, descripcion_TEXTO)
DELIMITER //
CREATE TRIGGER tr_mayusculas_gama BEFORE INSERT ON gama FOR EACH ROW
BEGIN
    SET new.descripcion_HTML = UPPER(new.descripcion_HTML), new.descripcion_TEXTO = UPPER(new.descripcion_TEXTO);
END;
//
DELIMITER ;
