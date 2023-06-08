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
// document.addEventListener("DOMContentLoaded", () =>{

// })
// Array(50).fill(Math.round(Math.random() * (500 - -500) + -500))
// arrNums = Array(50).fill(0);
// arrNums.map((x) => arrNums.has(Math.round(Math.random() * (500 - -500) + -500)))
let suma = 0;
let positivos = 0;
let positivosArr = [];
let negatibos = 0;
let negatibosArr = [];

const calculos = (arr) => {
  suma = arr.reduce((ac, currNum) => ac + currNum, 0);
  // console.log(suma);
  arr.forEach((num) => {
    if (Math.sign(num) === -1) {
      negatibos++;
      negatibosArr.push(num);
    } else if (Math.sign(num) === 1) {
      positivos++;
      positivosArr.push(num);
    }
  });
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

console.log(arrNums);
calculos(arrNums);
console.log(
  `Suma: ${suma}, Negativos: ${negatibos}, Positivos: ${positivos}, ${positivosArr}, ${negatibosArr}`
);

const renderArray = () => {
  arrNums.forEach((num) => {
    let nump = document.createElement("p");
    nump.textContent = num;
    nump.className = "numero";
    divNumeros.appendChild(nump);
  });
};
renderArray();
