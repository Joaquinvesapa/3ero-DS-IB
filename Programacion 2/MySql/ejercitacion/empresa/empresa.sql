CREATE table localidades(
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    postal int
    );
    
    CREATE table condicionesFiscales(
    id int PRIMARY KEY,
    nomrbe varchar(50),
    primerIVA double,
    segundoIVA double
    );
CREATE table proveedores(
    id int PRIMARY KEY AUTO_INCREMENT,
    razonSocial varchar(50),
    nombreFantacia varchar(50),
    direccion varchar(50),
    telefono varchar(20),
    localidad_id int,
    condicionFiscal ENUM("RI","EX","",),
    FOREIGN KEY (localidad_id) REFERENCES localidades(id)
    );
CREATE TABLE productos(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    descripcion varchar(150),
    precioCompra double,
    precioVenta double,
    stock int,
    stockMin int,
    stockMax int
    );
CREATE table clientes(
    id int PRIMARY key AUTO_INCREMENT,
    nombre varchar(50),
    cuit varchar(20),
    direccion varchar(50),
    telefono varchar(20),
    postal_id int,
    FOREIGN KEY (postal_id) REFERENCES localidades(id)
    );
CREATE TABLE comprobantes(
    id int PRIMARY KEY,
    tipoComprobante ENUM("FC","RE","NC","ND"),
    numero int,
    cliente_id int,
    fecha date,
    FOREIGN Key (cliente_id) REFERENCES clientes(id)
    );
CREATE TABLE detalleComprobantes(
    id int PRIMARY key,
    comprobante_id int,
    producto_id int,
    FOREIGN key (comprobante_id) REFERENCES comprobantes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
    );