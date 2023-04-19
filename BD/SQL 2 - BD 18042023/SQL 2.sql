CREATE DATABASE empresax

CREATE TABLE empleados(
    numero int PRIMARY KEY,
    nombre varchar(25),
    telefono nvarchar,
    fecha_nac datetime,
    salario int,
    fecha_ingreso_empresa datetime,
    comision int,
    num_hijos int
)

CREATE TABLE centros(
    numero int PRIMARY KEY,
    nombre varchar (50),
    direccion varchar(25)
)

CREATE TABLE departamentos(
    numero int PRIMARY KEY,
    nombre varchar(25) ,
    tipo_director varchar(2),
    num_director int,
    presupuesto int,
    num_empleado int REFERENCES empleados(numero),
    num_centro int REFERENCES centros(numero),
    depde int REFERENCES departamentos(numero),
    FOREIGN KEY num_empleado REFERENCES empleados(numero),
    FOREIGN KEY num_centro REFERENCES centros(numero),
    FOREIGN KEY depde REFERENCES departamentos(numero)
)

----------------------------------------------------------------

INSERT INTO centros (numero, nombre, direccion) VALUES
(10, "Sede Central", "C/ Atocha, 820, Madrid"),
(20, "Relación con Clientes", "C/ Atocha, 405, Madrid")

INSERT INTO departamentos(numero, num_centro, num_director, tipo_director,presupuesto, depde, nombre) VALUES
(100, 10, 260, "P", 72, null, "Dirección General"),
(110, 20, 180, "P", 90, 100, "Dirección Comercial"),
(111, 20, 180, "F", 66, 110, "Sector Industrial"),
(112, 2, 270, "P", 54, 110, "Sector Servicios"),
(120, 10, 150, "F", 18, 100, "Organización"),
(121, 10, 150, "P", 12, 120, "Personal"),
(122, 10, 350, "P", 36, 120, "Proceso de datos"),
(130, 10, 310, "P", 12, 100, "Finanzas")