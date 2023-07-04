const inpText = document.querySelector('.inp-text')
const inpSub = document.querySelector('.inp-sub')
const contadorPalabras = document.querySelector('.contador-palabras')
const divInforme = document.querySelector('.informe')

const PALABRAS = []
let totalLetras = 0
let palabraMasLarga = 0



const emitirInforme = () =>{
  PALABRAS.forEach(palabra => {
    totalLetras = totalLetras + palabra.length
  })
  
  const informeHTML = `<p>Promedio de Letras x Pala Cargadas: ${totalLetras/5}</p>
  
  <p>Palabra mas larga: Palabra n° ${palabraMasLarga+1} = ${PALABRAS[palabraMasLarga]} </p>
  <p>Ultima palbra inversa: ${PALABRAS.at(-1).split('').reverse().join('')} </p>
  <button onclick='window.location.reload()'>cargar mas palabras</button>`
  document.body.innerHTML = informeHTML;
}

inpSub.addEventListener('click', (e) => {
  if(inpText.value === ''){
    alert("Por favor ingrese una palabra")
  }else{
    PALABRAS.push(inpText.value)
    if(PALABRAS.length > 1 && inpText.value.length > PALABRAS[palabraMasLarga].length){
      palabraMasLarga = PALABRAS.length - 1
    }
    console.log(PALABRAS)
    inpText.value = ''
    contadorPalabras.textContent = `Palabras cargadas: ${PALABRAS.length}`
    if(PALABRAS.length === 5)emitirInforme();
  }
})
