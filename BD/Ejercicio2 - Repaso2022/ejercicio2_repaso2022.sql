CREATE DATABASE empresaCompraVenta

CREATE TABLE clientes (
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    descripcion varchar(50),
    calle varchar(25),
    numero int,
    ciudad varchar(25),
    comuna varchar(25)
)

CREATE TABLE telefonos(
    id int PRIMARY KEY AUTO_INCREMENT,
    numero int,
    cliente_id int,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id) 
)

CREATE TABLE ventas(
    id int PRIMARY KEY AUTO_INCREMENT,
    fecha datetime,
    cliente_id int,
    descuento int,
    monto_final int,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)

CREATE TABLE proveedores(
    id int PRIMARY KEY AUTO_INCREMENT,
    pagina_web varchar(255),
    telefono int,
    nombre varchar(25)
)

CREATE TABLE categorias(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    descripcion varchar(50)
)

CREATE TABLE productos(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    precio_actual int,
    proveedor_id int,
    categoria_id int,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores (id),
    FOREIGN KEY (categoria_id) REFERENCES categorias (id)
)

CREATE TABLE productos_ventas(
    id int PRIMARY KEY AUTO_INCREMENT,
    venta_id int,
    producto_id int,
    cantidad int,
    precio int,
    monton_total int,
    FOREIGN KEY (venta_id) REFERENCES ventas (id),
    FOREIGN KEY (producto_id) REFERENCES productos (id)
)

INSERT INTO proveedores(nombre, telefono, pagina_web)
VALUES ('MarsiaEx', '3416674863', 'www.lamarsiaex.com.ar'),
		('Moreno', '3417308285', 'www.moreno.com'),
		('Coscu', '3419276354', 'www.coscuasi.org'),
		('BelgranoHelados', '3418035674', 'www.belgranohelados.com.ar'),
		('Maiarmin', '3412978367', 'www.maiarmin.com.ar')
INSERT INTO productos(nombre, proveedor_id, categoria_id, precio_actual)
VALUES	('Fideos Matarazzo',2,2,500),
        ('Helado de Chocolate',1,1,700),
        ('Helado de Fruta',5,1,400),
        ('Ñoquis Basualdo',2,2,500),
        ('Ravioles Santiago',3,2,500),