/*
Escribir un programa en Javascript que cargue un array de 50 elementos con
números al azar entre -500 y 500, y que no se repitan. Luego deberá armar una
función que se llame Calculos que devolverá la suma de todos los elementos
del array, la cantidad de números positivos y la cantidad de números negativos
que se encuentren en el array. Fuera de la función, es decir en el script principal
de Javascript, deberá imprimir esos tres valores.
Por último, deberá armar un nuevo array sólo con los números negativos
encontrados en el anterior. Deberá imprimirlo por pantalla, y en caso de que no
se haya encontrado ningún número negativo, informar por pantalla de esta
situación.
*/
let arrNums = [];
const divNumeros = document.querySelector(".numeros");
const divResultados = document.querySelector(".resultados");
const btnCalcular = document.querySelector(".calcular");
// document.addEventListener("DOMContentLoaded", () =>{

// })
// Array(50).fill(Math.round(Math.random() * (500 - -500) + -500))
// arrNums = Array(50).fill(0);
// arrNums.map((x) => arrNums.has(Math.round(Math.random() * (500 - -500) + -500)))
let suma = 0;
let positivos = 0;
let positivosArr = [];
let negativos = 0;
let negatibosArr = [];
let resultados = {};
const renderResultados = () => {
  divResultados.innerHTML = "";
  for (resultado in resultados) {
    let sumaP = document.createElement("p");
    sumaP.innerHTML = `
      <div class="resultado">
        <p>${resultado}</p>
        <p>${resultados[resultado]}</p>
      </div>
    `;
    // sumaP.classList.add = "resultado";
    divResultados.appendChild(sumaP);
  }
};
const calculos = (arr) => {
  positivos = 0;
  negativos = 0;
  suma = arr.reduce((ac, currNum) => ac + currNum, 0);
  // console.log(suma);
  arr.forEach((num) => {
    if (Math.sign(num) === -1) {
      negativos++;
      negatibosArr.push(num);
    } else if (Math.sign(num) === 1) {
      positivos++;
      positivosArr.push(num);
    }
  });
  resultados.suma = suma;
  resultados.positivos = positivos;
  resultados.negativos = negativos; // resultados.push(positivos);
  renderResultados();
  // resultados.push(negativos);
};

const generarNumeroAleatorio = () =>
  Math.round(Math.random() * (500 - -500) + -500);

for (let i = 0; i < 50; i++) {
  let agrNum = generarNumeroAleatorio();
  while (arrNums.includes(agrNum)) {
    agrNum = generarNumeroAleatorio();
  }

  arrNums.push(agrNum);
}

btnCalcular.addEventListener("click", () => {
  calculos(arrNums);
});

// console.log(arrNums);
// calculos(arrNums);
// console.log(
//   `Suma: ${suma}, Negativos: ${negativos}, Positivos: ${positivos}, ${positivosArr}, ${negatibosArr}`
// );
// console.log(resultados);

const renderArray = () => {
  arrNums.forEach((num) => {
    let nump = document.createElement("p");
    nump.textContent = num;
    nump.className = "numero";
    divNumeros.appendChild(nump);
  });
};

renderArray();
