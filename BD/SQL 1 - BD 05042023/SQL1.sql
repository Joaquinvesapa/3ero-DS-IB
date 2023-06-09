CREATE DATABASE XYZ

CREATE TABLE alumnos (
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    sexo varchar(25),
    fecha_nac datetime,
    carrera_id int REFERENCES carreras (id)
)

CREATE TABLE carreras(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25)
)

CREATE TABLE cursos(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    cant_cred int CHECK ( cant_cred > 0),
    carrera_id REFERENCES carreras (id)
)

CREATE TABLE matriculas(
    id int PRIMARY KEY AUTO_INCREMENT,
    alumno_id REFERENCES alumnos (id),
    curso_id REFERENCES cursos (id),
    fecha datetime
)


----------------------------------------------------------------------------------------

INSERT INTO carreras(id, nombre) VALUES(1, 'RRHH'),(2, 'DS')


INSERT INTO ALUMNOS (id, nombre, fecha_nac, sexo, carrera_id VALUES
(1, "JUAN", "1990/01/01", "M", 1),
(2, "LUCAS", "1998/01/03", "M", 1), 
(3, "MARIA", "1999/12/03", "F", 1),
(4, "MALENA", "1997/12/22", "F", 2),
(5, "JUAN", "1999/11/01", "M", 2),
(6, "MARIANA", "2000/11/03", "F", 2);

INSERT INTO cursos(id, nombre, cant_cred, carrera_id) VALUES (1, "INGLES", 100, 1), (2, "ING DE SOFT", 150, 2), (3, "PROGRAMACION", 120, 2);

INSERT INTO matriculas(id, alumno_id, curso_id, fecha) VALUES
(1,1,1,"2021-03-10")
(2,1,2,"2021-03-10")
(3,1,3,"2021-03-10")
(4,3,1,"2021-03-11")
(5,4,2,"2021-03-10")
(6,4,3,"2021-03-11")
(7,5,1,"2021-03-12")
(8,5,3,"2021-03-12")
(9,6,1,"2021-03-10")
(10,6,1,"2021-03-10")


---
Modificaciones


ALTER TABLE alumnos ADD email varchar(20);

UPDATE alumnos SET email = "juan@gmail.com" WHERE id = 1

update cursos set nombre = "INGLES TECNICO" WHERE ID = 1

UPDATE cursos SET cant_cred = cant_cred + 20

CREATE TABLE docentes(
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25),
    fecha_nac datetime,
    especialidad varchar(25)
)

INSERT INTO docentes(id, nombre, fecha_nac, especialidad) VALUES
(1, "Daniela", "1995-01-01", "INGLES"),
(2, "Pedro", "1994-10-10", "INGENIERIA")

ALTER TABLE cursos ADD docente_id int REFERENCES docentes (id)

INSERT INTO alumnos(nombre, sexo, fecha_nac, carrera_id, email)VALUES
("Mateo", "M", "2001-02-20",2,"mateo@gmail.com")

INSERT INTO matriculas(alumno_id, curso_id, fecha)VALUES
(7, 2, GETDATE()),
(7, 3, GETDATE())
INSERT INTO matriculas(alumno_id, curso_id, fecha)VALUES
(7, 2, GETDATE()),
(7, 3, GETDATE())

