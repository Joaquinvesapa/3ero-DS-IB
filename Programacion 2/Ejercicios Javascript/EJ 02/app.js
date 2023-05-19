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
  "celsius-far": () => (input * 9) / 5 + 32,
  "celsius-kelvin": () => input + 273.15,
  "far-celsius": () => ((input - 32) * 5) / 9,
  "far-kelvin": () => ((input - 32) * 5) / 9 + 273.15,
  "kelvin-far": () => ((input - 273.15) * 9) / 5 + 32,
  "kelvin-celsius": () => input - 273.15,
};
