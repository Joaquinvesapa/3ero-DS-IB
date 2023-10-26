// Usando MongoDB representar el siguiente problema
// Una entidad educativa cuenta con la siguiente información:

// Un alumno  (Núm_Matrícula, Nombre, edad) puede estar matriculado de una o varias de las tres asignaturas  (Código_asignatura, Nombre, salón) que tiene la entidad educativa.
// En una asignatura habrá como mínimo 3 y como máximo 15 alumnos.
// Una asignatura es impartida por un único profesor  (Id_P, Nombre, Especialidad(puede tener más de una especialidad), Teléfono). Un profesor podrá impartir varias asignaturas.

// Crear la BD
//use escuela;

// Crear las colecciones.
db.createCollection("alumnos")
db.createCollection("asignaturas")
db.createCollection("profesores")

// Cargar los documentos de las mismas

// ALumnos: Juan Perez, 21/ Marta Gomez,19/ Pedro Antenor, 21/ Mara Liz, 20 / Luis Gonzalez,20/ Tomás Lopez, 20/ Ana Top, 20
// Profesor: Dario Mene, Matematico y Programador - Juana Mora, Programadora
// Asignaturas: Matemática(3 alumnos), Programación(4 alumnos), Lógica(3 alumnos)
// (Tener en cuenta que en la colección materias se debe encontrar los nombres de los alumnos que la cursan y el nombre del docente)
db.alumnos.insertMany([
  { Núm_Matrícula: 1, Nombre: "Juan Perez", Edad: 21 },
  { Núm_Matrícula: 2, Nombre: "Marta Gomez", Edad: 19 },
  { Núm_Matrícula: 3, Nombre: "Pedro Antenor", Edad: 21 },
  { Núm_Matrícula: 4, Nombre: "Mara Liz", Edad: 20 },
  { Núm_Matrícula: 5, Nombre: "Luis Gonzalez", Edad: 20 },
  { Núm_Matrícula: 6, Nombre: "Tomás Lopez", Edad: 20 },
  { Núm_Matrícula: 7, Nombre: "Ana Top", Edad: 20 },
])
db.profesores.insertMany([
  {
    id_profesor: 1,
    Nombre: "Dario Mene",
    Especialidad: ["Matematico", "Programador"],
    Telefono: 3417256739,
  },
  {
    id_profesor: 2,
    Nombre: "Juana Mora",
    Especialidad: ["Programadora"],
    Telefono: 2345765234,
  },
])

db.asignaturas.insertMany([
  {
    codigo_asignatura: 1,
    Nombre: "Matemática",
    Profesor: "Dario Mene",
    Salon: 1,
    Alumnos: ["Juan Perez", "Juan Perez", "Pedro Antenor"],
  },
  {
    codigo_asignatura: 2,
    Nombre: "Programación",
    Profesor: "Dario Mene",
    Salon: 2,
    Alumnos: ["Luis Gonzalez", "Ana Top", "Juan Perez", "Marta Gomez"],
  },
  {
    codigo_asignatura: 3,
    Nombre: "Lógica",
    Profesor: "Juana Mora",
    Salon: 3,
    Alumnos: ["Mara Liz", "Marta Gomez", "Pedro Antenor"],
  },
])
// Insertar una materia más.
db.asignaturas.insertOne({
  codigo_asignatura: 4,
  Nombre: "Literatura",
  Salon: 4,
  Alumnos: ["Mara Liz", "Luis Gonzalez", "Tomás Lopez"],
})

// Agregar a las asignaturas el campo nroAlumnos.
db.asignaturas.updateMany({}, { $set: { nroAlumnos: 0 } })

// Contar y mostrar la cantidad de alumnos de cada asignatura y cargar uno por uno de las cantidades
db.asignaturas.aggregate([
  {
    $project: {
      count: {
        $size: "$Alumnos",
      },
    },
  },
])

db.asignaturas.find(
  {},
  {
    count: {
      $size: "$Alumnos",
    },
  }
)
db.asignaturas.updateMany({}, [
  {
    $set: {
      nroAlumnos: { $size: "$Alumnos" },
    },
  },
])
// Mostrar el listado de materias que tienen mas de 3 alumnos
db.asignaturas.find({ nroAlumnos: { $gt: 3 } })

// Mostrar el listado de materias que tienen ma de 3 alumnos y cuyo profesor es Dario Mene
db.asignaturas.find({ nroAlumnos: { $gt: 3 }, Profesor: "Dario Mene" })

// Mostrar los nombres de los alumnos mayores a 20 años
db.alumnos.find({ Edad: { $gt: 20 } }, { Nombre: 1 })

// Agregar un docente con solamente los campos id y nombre
db.profesores.insertOne({ id_profesor: 3, Nombre: "Guido Cardarelli" })

// Mostrar los docentes sin especialidad
db.profesores.find({ Especialidad: { $exists: true } })

// Mostrar los docentes que son matemáticos
db.profesores.find({ Especialidad: { $in: ["Matematico"] } })

// Modificar el apellido del primer alumno por Mercado
db.alumnos.updateOne({ Núm_Matrícula: 1 }, { $set: { Nombre: "Juan Mercado" } })

// Agregarle a todos los docentes la especialidad “Docente”
db.profesores.updateMany({}, { $push: { Especialidad: "Docente" } })

// Ordenar a los alumnos por edades
db.alumnos.find().sort({ Edad: 1 }) //Positivo creciente y negativo decreciente

// Mostrar los nombres de las materias y el detalle de los alumnos (nombre y edad)
db.asignaturas.aggregate([
  {
    $lookup: {
      from: "alumnos",
      localField: "Alumnos",
      foreignField: "Nombre",
      as: "Alumnos",
    },
  },
  // {
  //   $unwind: "$Alumnos",
  // },
  {
    $project: {
      Asignatura: "$Nombre",
      NombreAlumno: ["$Alumnos.Nombre", "$Alumnos.Edad"],
      // AlumnosData: {
      //   // EdadAlumno: "$Alumnos.Edad",
      // },
    },
  },
])

// Mostrar los profesores junto a la información de las materias y la cantidad de alumnos de las mismas que dicta
db.profesores.aggregate([
  {
    $lookup: {
      from: "asignaturas",
      localField: "Nombre",
      foreignField: "Profesor",
      as: "Asignaturas",
    },
  },
  {
    $project: {
      Nombre: 1,
      Especialidad: 1,
      Telefono: 1,
      Asignaturas: "$Asignaturas",
      NroAlumnos: "$Asignaturas.nroAlumnos",
    },
  },
])

// Mostrar los nombres de los  profesores junto los nombres de las materias que dicta
db.profesores.aggregate([
  {
    $lookup: {
      from: "asignaturas",
      localField: "Nombre",
      foreignField: "Profesor",
      as: "Asignaturas",
    },
  },
  {
    $project: {
      Nombre: 1,
      Especialidad: 1,
      Telefono: 1,
      Asignaturas: "$Asignaturas.Nombre",
    },
  },
])

// Mostrar las materias dadas por un profesor X(Usar Match)
db.profesores.aggregate([
  {
    $lookup: {
      from: "asignaturas",
      localField: "Nombre",
      foreignField: "Profesor",
      as: "Asignaturas",
    },
  },
  {
    $match: {
      Nombre: "Juana Mora",
    },
  },
  {
    $project: {
      Nombre: 1,
      Especialidad: 1,
      Telefono: 1,
      Asignaturas: "$Asignaturas.Nombre",
    },
  },
])

// Contar la cantidad de materias donde trabaja el profesor X
db.profesores.aggregate([
  {
    $lookup: {
      from: "asignaturas",
      localField: "Nombre",
      foreignField: "Profesor",
      as: "Asignaturas",
    },
  },
  {
    $match: {
      Nombre: "Dario Mene",
    },
  },
  {
    $project: {
      Nombre: 1,
      Especialidad: 1,
      Telefono: 1,
      Asignaturas: { $size: "$Asignaturas.Nombre" },
    },
  },
])

// Crear un indice en la tabla Materias por cantidades de alumnos en forma ascendente
db.asignaturas.createIndex({ nroAlumnos: 1 })

//  Crear un indice en la tabla Materias indexando por nombre de materias y nombre de alumnos. Colocarle el nombre MateriasyAlumnos
db.asignaturas.createIndex(
  { Nombre: 1, Alumnos: 1 },
  { name: "MateriasyAlumnos" }
)

//  Agregarle el campo dni a los docentes.
db.profesores.find().forEach((doc) => {
  db.profesores.updateOne(
    { _id: doc._id },
    { $set: { dni: Math.floor(Math.random() * 46000000) } } //Floor abajo, Ceil arriba, round depende por el 0.5
  )
})

// Crea un indice en el campo dni de los docentes, éste debe ser único
db.profesores.createIndex({ dni: 1 }, { unique: true })
