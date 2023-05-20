// 2) Ingresando una temperatura, convertirla a las otras tres escalas. Las escalas conocidas
// son: Roemer (°R), Farenheit (°F), Celsius (°C), Kelvin (°K). Hacer una interfaz ingeniosa
// con varios controles.
/*
"celsius-far": (input × 9/5) + 32,
"celsius-kelvin": input + 273.15,
"far-celsius" : (far − 32) × 5/9 ,
"far-kelvin" : (far − 32) × 5/9 + 273.15,
"kelvin-far" : (kel − 273.15) × 9/5 + 32,
"kelvin-celsius" : kel − 273.15,
*/

const FORMULAS = {
  "celsius-farenheit": (input) => (input * 9) / 5 + 32,
  "celsius-kelvin": (input) => input + 273.15,
  "celsius-roemer": (input) => input * 0.525 + 7.5,
  "farenheit-celsius": (input) => ((input - 32) * 5) / 9,
  "farenheit-kelvin": (input) => ((input - 32) * 5) / 9 + 273.15,
  "farenheit-roemer": (input) => (input - 32) * 0.29167 + 7.5,
  "kelvin-farenheit": (input) => ((input - 273.15) * 9) / 5 + 32,
  "kelvin-celsius": (input) => input - 273.15,
  "kelvin-roemer": (input) => (input - 273.15) * 0.525 + 7.5,
  "roemer-celsius": (input) => (input - 7.5) / 0.525,
  "roemer-farengeit": (input) => (input - 7.5) * 3.4286 + 32.0,
  "roemer-kelvin": (input) => (input - 7.5) / 0.525 + 273.15,
};
const temps1 = document.getElementById("temps1");
const temps2 = document.getElementById("temps2");
const btnCalc = document.getElementById("btnCalc");
const result = document.getElementById("result");

btnCalc.addEventListener("click", () => {
  if (temps1.value === temps2.value) {
    alert("Las temperaturas son iguales");
  } else {
    const num = document.getElementById("num").value;
    let formulaName = temps1.value + "-" + temps2.value;
    const answ = FORMULAS[formulaName](new Number(num)).toFixed(2);
    result.innerHTML = answ;
    // console.log(FORMULAS[formulaName](new Number(num)).toFixed(2));
  }
});
