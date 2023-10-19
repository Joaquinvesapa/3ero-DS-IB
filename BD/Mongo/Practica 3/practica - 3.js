db.createCollection("usuarios");
db.createCollection("direcciones");

db.usuarios.insertMany([
  {
    NombreCompleto: "Joaquin Vesco Aparicio",
    Edad: 20,
    Genero: "Masculino",
    Nacionalidad: "Argentino",
  },
  {
    NombreCompleto: "Guido Carda",
    Edad: 21,
    Genero: "Masculino",
    Nacionalidad: "Peruano",
  },
]);

db.direcciones.insertMany([
  {
    NombreCompleto: "Joaquin Vesco Aparicio",
    Numero: 33,
    Calle: "Las Rosas",
    Ciudad: "Funes",
  },
  {
    NombreCompleto: "Joaquin Vesco Aparicio",
    Numero: 44,
    Calle: "Catamarca",
    Ciudad: "Rosario",
  },
]);

//JOIN -> 1 registro con todas sus relaciones
db.usuarios.aggregate([
  {
    $lookup: {
      from: "direcciones",
      localField: "NombreCompleto",
      foreignField: "NombreCompleto",
      as: "Domicilio",
    },
  },
]);

//INNER JOIN -> 1 registro por cada relacion que tenga
db.usuarios.aggregate([
  {
    $lookup: {
      from: "direcciones",
      localField: "NombreCompleto",
      foreignField: "NombreCompleto",
      as: "Domicilio",
    },
  },
  {
    $unwind: "$Domicilio",
  },
]);

//INNER JOIN pero agregando campos por separado
db.usuarios.aggregate([
  {
    $lookup: {
      from: "direcciones",
      localField: "NombreCompleto",
      foreignField: "NombreCompleto",
      as: "Domicilio",
    },
  },
  {
    $unwind: "$Domicilio",
  },
  {
    $addFields: {
      calle: "$Domicilio.Calle",
      ciudad: "$Domicilio.Ciudad",
    },
  },
]);

//$project funciona como alias indicandole en un objeto los campos que queremos mostrar
db.usuarios.aggregate([
  {
    $lookup: {
      from: "direcciones",
      localField: "NombreCompleto",
      foreignField: "NombreCompleto",
      as: "Domicilio",
    },
  },
  {
    $unwind: "$Domicilio",
  },
  {
    $addFields: {
      Calle: "$Domicilio.Calle",
      Ciudad: "$Domicilio.Ciudad",
    },
  },
  {
    $project: {
      NombreCompleto: 1,
      Edad: 1,
      Genero: 1,
      Calle: 1,
      Ciudad: 1,
    },
  },
]);

//use blog;

db.createCollection("usuarios");

db.usuarios.insertMany([
  {
    nombre: "Juan",
    twitter: "JuanTwit",
    descripcion: "aaa",
    telefonos: ["73128989", "43278944"],
    direccion: {
      calle: "Av. de los Castros",
      numero: "2256",
      cp: "39005",
      ciudad: "Santander",
    },
  },
  {
    nombre: "Frank",
    twitter: "Frank_USE",
    descripcion: "blogger aficionado",
    telefonos: ["73128989", "43278944", "6536256"],
    direccion: {
      calle: "Av. Pelegrini",
      numero: "300",
      cp: "39005",
      ciudad: "Santander",
    },
  },
  {
    nombre: "Peter",
    twitter: "Pete",
    descripcion: "blogger",
    telefonos: ["808080", "4323424", "423232"],
    direccion: {
      calle: "Av. de los Castros",
      numero: "289s",
      cp: "39005",
      ciudad: "Santander",
    },
  },
]);

db.noticias.insertMany([
  {
    titulo: "Noticia de impacto",
    cuerpo: "CUERPO DE LA NOTICIA",
    fecha: "2014-10-21",
    tags: ["A", "B"],
    nombreU: "Juan",
  },

  {
    titulo: "Noticia de impacto2",
    cuerpo: "NOTICIA CB",
    fecha: "2022-10-21",
    tags: ["C", "B"],
    nombreU: "Juan",
  },

  {
    titulo: "Noticia de impacto3",
    cuerpo: "NOTICIA GB",
    fecha: "2022-5-21",
    tags: ["G", "B"],
    nombreU: "Peter",
  },

  {
    titulo: "Noticia de impacto4",
    cuerpo: "NOTICIA ZZ",
    fecha: "2022-5-11",
    tags: ["Z", "Z"],
    nombreU: "Peter",
  },

  {
    titulo: "Noticia de impacto5",
    cuerpo: "NOTICIA xx",
    fecha: "2021-8-21",
    tags: ["X", "X"],
    nombreU: "Frank",
  },
]);


//Ejercicio 5
// Mostrar las usuarios con los detalles de las noticias que escribieron, mostrando cada usuario con cada noticia en forma separada.
db.usuarios.aggregate([
  {
    $lookup: {
      from: "noticias",
      localField: "nombreU",
      foreignField: "nombre",
      as: "Noticia",
    },
  },
  {
    $unwind: "$Noticia",
  },
]);

//Ejercicio 6
// Mostrar las usuarios con los detalles de las noticias que escribieron, mostrando cada usuario el listado de todas sus noticias
db.usuarios.aggregate([
  {
    $lookup: {
      from: "noticias",
      localField: "nombreU",
      foreignField: "nombre",
      as: "Noticia",
    },
  },
]);

//Ejercicio 7
// Mostrar nombre de usuario, cuenta de twitter y titulo de la notas que escribio
db.usuarios.aggregate([
  {
    $lookup:{
      from: "noticias",
      localField: "nombre",
      foreignField: "nombreU",
      as: "Noticia"
    }
  },
  {
    $addFields: {
      titulo: "$Noticia.titulo"
    }
  },
  {
    $project:{
      nombre: 1,
      twitter: 1,
      titulo: 1
    }
  }
]);

//Ejercicio 8
// Mostrar cada una de las noticias con el detalle del usuario que la escribió

db.noticias.aggregate([
  {
    $lookup: {
      from: "usuarios",
      localField: "nombreU",
      foreignField: "nombre",
      as: "Usuario"
    }
  }
])

//Ejercicio 8.1
//Mostar  solamente el titulo de la noticia, el nombre de usuario que lo escribio y el twitter del mismo

db.noticias.aggregate([
  {
    $lookup:{
      from: 'usuarios',
      localField: 'nombreU',
      foreignField: 'nombre',
      as: "Usuario"
    }
  },
  {
    $addFields: {
      Twitter: "$Usuario.twitter"
    }
  },
  {
    $project:{
      titulo: 1,
      nombreU: 1,
      Twitter: 1
    }
  }
])

//Ejercicio 9
// Agregar a los documentos de noticias un campo llamado cantidad de palabras y colocarles valores x
// db.noticias.updateMany({},{$unset:{cantidadDePalabras:""}})

db.noticias.updateMany({},{$set:{cantidadDePalabras: "X"}})
//Ejericio 10
// -Usando la instrucción match, mostrar los datos de Juan.

db.usuarios.aggregate([
  {
    $match: {nombre:"Juan"}
  }
])

//Ejercicio 11
//Usando la instrucción match, mostrar los datos de las noticias de Juan.
db.noticias.aggregate([
  {
    $match: {nombreU: "Juan"}
  }
])

//Ejercicio 12
// Mostrar nombre de usuario, cuenta de twitter , titulo de la notas que escribió y la cantidad de palabras escritas de Peter
db.usuario.aggregate([
  {
    $lookup:{
      from: "noticias",
      localField: "nombre",
      foreignField: "nombreU",
      as: "Noticias"
    }
  },
  {
    $project:{
      "$Noticias.nombreU": 1,
      "$Noticias.titulo": 1,
      twitter: 1,
      "$Noticias.cantidadDePalabras": 1
    }
  },
  {
    $match:{nombre: "Peter"}
  }
])