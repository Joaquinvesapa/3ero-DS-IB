const numAl = document.querySelector('.num-al')
const inpText = document.querySelector('.inp-text')
const inpSub = document.querySelector('.inp-sub')
const contadorPalabras = document.querySelector('.contador-palabras')
const divInforme = document.querySelector('.informe')
// const listPalabras = document.querySelector('.listPalabras')

// let numeroAleatorio = Math.round(Math.random() * (25 - 5) + 5)
const PALABRAS = []
let totalLetras = 0
let numeroAleatorio = 5

numAl.textContent = `numero aleatorio = ${numeroAleatorio}`

const validarPalindromo = (palabra) => {
  let palabraInversa = palabra.split('').reverse().join('')

  return palabra === palabraInversa //devuelve true por defecto y false si es false
}


const emitirInforme = () =>{
  document.body.innerHTML = ''
  let listPalabras = document.createElement('ul')
  PALABRAS.forEach(palabra => {
    totalLetras = totalLetras + palabra.length
    let palabraLi = document.createElement('li')
    palabraLi.innerHTML = `${palabra} - Es palindromo: ${validarPalindromo(palabra) ? 'Si' : 'No'} - Es ${palabra.length % 2 === 0 ? 'Par' : 'Impar'}`
    listPalabras.appendChild(palabraLi)
  })
  document.body.appendChild(listPalabras)

  // console.log(informeHTML)

  const informeHTML = `
  <p>Promedio de Letras x Pala Cargadas: ${totalLetras/5}</p>
  <button onclick='window.location.reload()'>cargar mas palabras</button>`
  console.log(informeHTML)

  document.body.innerHTML += informeHTML;
  // document.body.innerHTML =+ listPalabras;
}

inpSub.addEventListener('click', (e) => {
  if(inpText.value === ''){
    alert("Por favor ingrese una palabra")
  }else{
    PALABRAS.push(inpText.value)
    console.log(PALABRAS) 
    inpText.value = ''
    contadorPalabras.textContent = `Palabras cargadas: ${PALABRAS.length}`
    if(PALABRAS.length === 5)emitirInforme();
  }
})




// Math.round(Math.random() * (500 - -500) + -500);