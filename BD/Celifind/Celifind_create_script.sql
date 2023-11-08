CREATE DATABASE Celifind;

CREATE TABLE tipos_usuarios(
  id int PRIMARY KEY,
  codigo varchar(50),
  denominacion varchar(50)
);

CREATE TABLE estados(
  id int PRIMARY KEY,
  denominacion varchar(50)
);

CREATE TABLE productos(
  id int PRIMARY KEY,
  nombre varchar(100),
  descripcion varchar(250)
);