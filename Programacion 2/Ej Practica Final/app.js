// Desarrollar una página web con HTML, CSS y Javascript que permita:
// - Cargar los siguientes datos referentes a taxis de la ciudad: dominio (patente formada
// por tres letras y tres dígitos o patente formada por dos letras, tres dígitos, y dos
// letras), recaudación del mes de mayo (en $), cantidad de viajes realizados en el
// mismo mes, color original del vehículo antes de ser pintado como taxi (se debe
// elegir de un combo con las siguientes opciones: rojo, azul, gris, blanco, otros).
// - Contener un botón que permita obtener, una vez cargados todos los datos, la
// siguiente estadística a partir de lo cargado en memoria: recaudación total (de todos
// los taxis), promedio de viajes realizados por vehículo en el mes de mayo, cantidad
// de autos cuyas patente o dominio finalice en numeración par, cantidad de viajes
// realizados por autos que originalmente eran de color blanco. 

const inpPatente = document.getElementById('patente')
const inpRecaudación = document.getElementById('reacuadación')
const inpCantViajes = document.getElementById('cant-viajes')
const inpColores = document.getElementById('colores')
const btnCargar = document.getElementById('cargar')
const btnCalcular = document.getElementById('calcular') 
const form = document.getElementById('form')

let valido = true
let patentes = []
let reacuadaciónTotal = 0
let cantViajes = []
let viajesAutosblancos = 0
let patentesPar = 0

const validarPatente = (patente) =>{
        if(patente.length === 6){
            let letras = patente.slice(0,2).split("")
            let numeros = patente.slice(3,5).split("")
            if(Number(numeros.slice(-1))%2 === 0 ){
                patentesPar++
            }
            return valido = (
                letras.every((l) => LETRAS.includes(l.toLowerCase())) &&
                numeros.every((n) => NUMEROS.includes(n))
              )
        }else if(patente.length === 7){
            let letras = `${patente.slice(0,2)}${patente.slice(5,7)}`.split("")
            console.log(letras)
            let numeros = patente.slice(3,5).split("")
            return valido = (
                letras.every((l) => LETRAS.includes(l.toLowerCase())) &&
                numeros.every((n) => NUMEROS.includes(n))
              )
        }
}


btnCargar.addEventListener('click', (e) =>{
    if(patente.length < 6 || patente.length >7){
        alert('Ingrese una patente de minimos 6 caracteres y maximo 7')
    }else{
        if(validarPatente(inpPatente.value)){
            reacuadaciónTotal += Number(inpRecaudación.value)
            cantViajes.push(Number(inpCantViajes.value))
            patentes.push(inpPatente.value)
            if(inpColores.value === 'blanco'){
                viajesAutosblancos += Number(inpCantViajes.value)
            }


            console.log(`recaudaciòn total: ${reacuadaciónTotal}, Promedio: ${(cantViajes.reduce((ac, curViaje) => ac + curViaje, 0))/(cantViajes.length)}, viajes Autos blancos: ${viajesAutosblancos},Patentes pares: ${patentesPar}`)
            form.reset()
        }else{
            alert('la patente ingresada es invalida')
        }
    }
})

btnCalcular.addEventListener('click', () =>{
    
})

const LETRAS = [
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','ñ','o','p','q','r','s','t','u','v','w','x','y','z'
]
const NUMEROS = [
    '0','1','2','3','4','5','6','7','8','9'
]




