const answ = document.getElementById("ans");
const btnCalc = document.getElementById("btnCalc");

const factorial = (n) => {
  let res = 1;
  for (i = 1; i <= n; i++) {
    res = res * i;
  }
  return res;
};

btnCalc.addEventListener("click", () => {
  const num = document.getElementById("num").value;
  // console.log(Number(num));
  if (Number.isInteger(Number(num)) === true) {
    answ.innerHTML = factorial(num);
  } else {
    alert("El numero ingresado no es un numero entero");
  }
});
