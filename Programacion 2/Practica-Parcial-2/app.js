// Desarrollar una página web con HTML, CSS y Javascript que permita:
// - Generar un arreglo cargado con 732 objetos cuyos atributos son:
// o Edad (debe generarla como un número aleatorio entre 20 y 120).
// o Número preferido (debe generarlo como un número entero aleatorio entre 0 y
// 100).
// o Cantidad de libros leídos en la última década (debe generarlo como un
// número aleatorio entre 1 y 50).
// - Al finalizar la generación del arreglo anterior, debe mostrar la cantidad de personas
// de cada edad, el porcentaje de números pares preferidos y el porcentaje de números
// impares preferidos respecto al total de números, la cantidad de libros leídos por la
// gente de cada rango etáreo siendo el rango etáreo la década (por ejemplo, la
// cantidad de libros leídos por las personas de 20 a 30 años, la cantidad de libros
// leídos por las personas de 30 a 40 años, etc). 


let array = new Array
const contarEdades = ()=>{
    let edades =new Array(100).fill(0)
    array.forEach(p=>{
        // console.log(p)
        edades[p.Edad-20]++
    })

}
const contarNumPares = ()=>{
    let pares = 0
    let ceros = 0
    let impares =0 
    array.forEach(p=>{
        if(p["Numero Preferido"]%2 === 0 && p["Numero Preferido"] != 0 ){
            pares++
        }else if(p["Numero Preferido"] === 0 ){
            ceros++
        }else{
            impares++
        }
    })
    let porcentajePares = Math.floor((pares * 100 )/(762-ceros))
    let porcentajeCeros = (ceros * 100 )/762
    // console.log(porcentajeCeros)
    console.log("Pares: "+porcentajePares+"% IMpares: "+ (100-porcentajePares)+"%")
}


const contCantLibroLeidosXDec = () =>{
    let decs = Array(12).fill(0)
    array.forEach(p=>{
        let edDec = Math.floor(p.Edad/10)
        decs[edDec] += p["Libros leidos"]
    })
    // console.log(decs)
}

const getArr = () =>{
    for(let i = 0; i<732; i++){
        let newObj = {Edad:0, "Numero Preferido":0, "Libros leidos":0}  
        newObj.Edad = Math.round(Math.random() * (120 - 20) + 20)
        newObj["Numero Preferido"] = Math.round(Math.random() * (100 - 0) + 0)
        newObj["Libros leidos"] = Math.round(Math.random() * (50 - 1) + 1)
        array.push(newObj)
    }
    console.log(array)
    
}


getArr()
contarEdades()
contarNumPares()
contCantLibroLeidosXDec()
// const aa = () =>{
//     array.forEach(p =>{
//         p.push(newObj)
//     })

// }

// aa()
// console.log(array)