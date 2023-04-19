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