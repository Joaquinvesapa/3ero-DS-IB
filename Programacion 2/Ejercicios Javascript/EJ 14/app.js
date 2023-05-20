const answ = document.getElementById("ans");
const btnCalc = document.getElementById("btnCalc");
/*
// De esta manera se genera una baja en el rendimiento 
let fib = function (n) {
  if (n <= 1) return n; // si es 1 o 0 retorna 1 o 0 respectivamente
  return fib(n - 1) + fib(n - 2); // en caso contrario se genera la secuencia
};
 */
const fibonacci = (num) => {
  const fib = [0, 1];
  for (let i = 2; i <= num; i++) {
    fib[i] = fib[i - 1] + fib[i - 2];

    //console.log(fib[i], ` fib[${i}]`);
  }
  return fib[num];
};

btnCalc.addEventListener("click", () => {
  const num = document.getElementById("num").value;
  let res = num < 0 ? alert("No es un numero natural") : fibonacci(num);
  answ.innerHTML = res;
});
