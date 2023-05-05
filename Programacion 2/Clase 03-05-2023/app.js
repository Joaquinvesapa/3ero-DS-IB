elResultado = document.querySelector(".text");

let num = prompt("Ingrese un numero");
let vacio = "";

// if (!isNaN(num)) {
//   const text = `El numero ingresado es: ${num}`;
//   document.getElementById("text").innerHTML = text;
//   for (let i = 0; i < 11; i++) {
//     document.getElementById("table").innerHTML += "<tr>" + num + " X " + i + " = " + i * num + "<tr>";
//     document.getElementById("table").innerHTML += row;
//   }
{/* <input class="btn" type="button" value="Reintentar"></input> */}
if (!num.length) {
  document.getElementById("table").innerHTML +=
    "<h3>El campo no puede ser vacio</h2>";
  document.getElementById('content').innerHTML += "<input id='btn' type='button' value='Reintentar'></input>";
  document.getElementById('btn').addEventListener('click', function() {window.location.reload()});
} else if (isNaN(num)) {
  document.getElementById("table").innerHTML +=
    "<h3>El valor ingresado no es un numero</h2>";
  document.getElementById('content').innerHTML += "<input id='btn' type='button' value='Reintentar'></input>";
  document.getElementById('btn').addEventListener('click', function() {window.location.reload()});
} else {
  const text = `El numero ingresado es: ${num}`;
  document.getElementById("text").innerHTML = text;
  for (let i = 0; i < 11; i++) {
    document.getElementById("table").innerHTML +=
      "<tr>" + num + " X " + i + " = " + i * num + "<tr>";
  }
}




// if (!isNaN(parseInt(num))) {
//   const text = "El numero ingresado es: " + num;
//   document.getElementById("text").innerHTML = text;
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 0 + " = " + 0 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 1 + " = " + 1 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 2 + " = " + 2 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 3 + " = " + 3 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 4 + " = " + 4 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 5 + " = " + 5 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 6 + " = " + 6 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 7 + " = " + 7 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 8 + " = " + 8 * num + "<tr>";
//   document.getElementById("table").innerHTML +=
//     "<tr>" + num + " X " + 9 + " = " + 9 * num + "<tr>";
// } else {
//   alert("El valor ingresado es invalido");
//   document.getElementById("table").innerHTML +=
//     "<h3>El valor ingresado es invalido</h2>";
//   document.getElementById('content').innerHTML += "<input id='btn' type='button' value='Reintentar'></input>";
// }

// console.log(num)
