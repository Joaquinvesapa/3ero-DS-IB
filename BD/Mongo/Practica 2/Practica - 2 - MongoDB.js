// 1 - Creo una base de datos llamada personas
use("persosas");

// 2 - Creo una colección dentro de personas llamada amigos
db.createCollection("amigos");

// 3 - Insertamos los datos de 5 personas cuyos datos son: nombre, apellido, edad, aficciones (futbol, tenis, musica, pintura, etc), telefonos(puede ser más de uno), dirección (compuesta por calle, nro, ciudad),amigos (compuesto por nombre y edad).
db.amigos.insertMany({
    "_id" : ObjectId("632c50cf06fe4be888b1c511"),
    "Nombre" : "Marisa",
    "Apellidos" : "García",
    "Edad" : 18.0,
    "Aficiones" : [ 
        "senderismo", 
        "tenis", 
        "pintura"
    ],
    "telefonos" : [ 
        "73128989", 
        "43278944"
    ],
    "direccion" : {
        "calle" : "Av. de los Castros",
        "numero" : "2256",
        "ciudad" : "Santander"
    },
    "Amigos" : [ 
        {
            "Nombre" : "Monica",
            "Edad" : 20.0
        }
    ]
},
{
    "_id" : ObjectId("632c50cf06fe4be888b1c512"),
    "Nombre" : "Luís",
    "Apellidos" : "Martinez",
    "Edad" : 18.0,
    "Aficiones" : [ 
        "fútbol", 
        "senderismo", 
        "tenis"
    ],
    "telefonos" : [ 
        "808080", 
        "4323424", 
        "423232"
    ],
    "direccion" : {
        "calle" : "Mitre",
        "numero" : "289s",
        "ciudad" : "Rosario"
    },
    "Amigos" : [ 
        {
            "Nombre" : "Monica",
            "Edad" : 20.0
        }, 
        {
            "Nombre" : "Andrés",
            "Edad" : 24.0
        }
    ]
},
{
    "_id" : ObjectId("632c50cf06fe4be888b1c513"),
    "Nombre" : "Luís",
    "Apellidos" : "Martinez",
    "Edad" : 28.0,
    "Aficiones" : [ 
        "natación", 
        "culturismo"
    ],
    "telefonos" : [ 
        "808080", 
        "4323424", 
        "423232"
    ],
    "direccion" : {
        "calle" : "Mitre",
        "numero" : "289s",
        "ciudad" : "Rosario"
    },
    "Amigos" : [ 
        {
            "Nombre" : "Juan",
            "Edad" : 40.0
        }, 
        {
            "Nombre" : "Antonio",
            "Edad" : 52.0
        }
    ]
},
{
    "_id" : ObjectId("632c520f06fe4be888b1c514"),
    "Nombre" : "Joaquin",
    "Apellidos" : "Rodriguez",
    "Edad" : 29.0,
    "Aficiones" : [ 
        "fútbol", 
        "natación"
    ],
    "direccion" : {
        "calle" : "Sarmiento",
        "numero" : "289",
        "ciudad" : "Rosario"
    },
    "Amigos" : [ 
        {
            "Nombre" : "Andrés",
            "Edad" : 24.0
        }
    ]
})

// 4 - Mostrar todos los datos de la colección en forma legible
db.amigos.find();

// 5 - Se desea ver personas mayores de 25 años
db.amigos.find({edad:{$gt: 25}});

// 6 - Mostrar el nombre, apellido y edad de las personas que se llamen Marisa
db.amigos.find({Nombre: "Marisa"},{Nombre: 1, Apellido: 2, Edad: 3});

// 7 -Mostrar nombre y apellidos de los mayores de 25 años
db.amigos.find({Edad: {$gt: 25}}, {Nombre: 1, Apellidos: 2});

// 8 - Insertar un documento mas solamente que tenga nombre, edad y aficciones
db.amigos.insertOne({Nombre: "Joaquin", Edad: 21, Aficciones: ["Telista", "Developer", "Musico"]});

// 9 - Mostrar los nombres de las personas que no tengan amigos
db.amigos.find({Amigos:{$exists:false}},{Nombre:1});

// 10  -Mostrar nombre y aficiones de las personas que tienen mas de 17 años
db.amigos.find({Edad: {$gt: 17}}, {Nombre: 1, Afficiones: 2});

// 11 - Mostrar las personas que juegan al tenis
db.amigos.find({Aficiones: {$all: ["tenis"]}});

// 12 - Mostrar las personas mayores a 17 años y que juegan al tenis
db.amigos.find({Edad: {$gt: 17}, Aficiones: {$all: ["tenis"]}})

// 12A-  Mostrar las personas mayores a 28 años o que juegan al tenis
db.amigos.find({$or: [{Edad: {$gt: 28}},{ Aficiones: {$all: ["tenis"]}}]})

// 13 - Agregar los siguientes campos
// Primer registro, profesión: Desarrollador y mail: Desarrollador@gmail.com
db.amigos.updateOne({},{$set: {"Profesion": "Desarrollador", "Mail":"Desarrollador@gmail.com"}})

// 14 -Modificar el apellido de Juan a Gomez
db.amigos.updateOne({Nombre: "Luís"},{$set: {Apellidos: "Gomez"}});

// 15 - Crear una variable y asignarle el siguiente json
/*{
     "Nombre" : "Juan",
    "Apellidos" : "Perez",
    "Edad" : 29.0,
    "Aficiones" : [ 
        "fútbol", 
        "natación” ],
        "Amigos" : [ 
        {
            "Nombre" : "Luis",
            "Edad" : 18.0
        }
    ]
}*/
// 16 - Agregarle una nueva aficion: Voley a todos los que tengan más de 20 años

// 17 - Sacarle la aficion futbol a todos los que tengan más de 20 años
// 18 - Al documento agregado en el punto 15, agregarle la siguiente dirección:
// calle: "Sarmiento",numero:333, ciudad:Rosario

// 19 - Agregarle el siguiente amigo al documento anterior:
// Carolina, 20 años
// 20 - Modificar el documento anterior eliminando los campos que tiene agregando solamente la profesión de Desarrollador (tener en cuenta que tenemos que mantener nombre y apellido)
// 21 - Eliminar el último documento creado
// 22 - Mostrar los nombres de las personas de este documento junto a la ciudad donde viven
// 23 - Agregarle a los documentos de las personas que son de Rosario, el campo “Habitantes:2000000”

// 24 - Modificar las edades de las personas registrados en el documento aumentando la edad en 1
// 25 - Mostrar los documentos ordenados de menor a mayor por edades
// 26 - Mostrar los campos nombre y edad de los documentos ordenados de mayor a menor por edades



