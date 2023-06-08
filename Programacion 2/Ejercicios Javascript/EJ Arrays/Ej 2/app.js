const notasAlumnos = document.querySelector(".notas-alumnos");
const listAbanderados = document.querySelector(".abanderados");
const btnCargarNotasAlumnos = document.querySelector(".cargar-notas");
const btnVerAbanderados = document.querySelector(".ver-abanderados");

// let arreglo = [];
// for (let i = 0; i < 30; i++) {
//   let num = Math.random() * (10 - 0) + 1;
//   arreglo.push(Math.round(num));
// }
let arreglo = [];

btnCargarNotasAlumnos.addEventListener("click", () => {
  notasAlumnos.innerHTML = "";
  arreglo = [];
  for (let i = 0; i < 30; i++) {
    let num = Math.random() * (10 - 0) + 0;
    arreglo.push([Math.round(num), i]);
  }
  arreglo.forEach((nota) => {
    const li = document.createElement("li");
    li.textContent = `Nota Alumno N° ${nota[1]}: ${nota[0]}`;
    li.className = "nota-alumno";
    notasAlumnos.appendChild(li);
  });
  console.log(arreglo);
});

function compare(a, b) {
  return b[0] - a[0];
}

btnVerAbanderados.addEventListener("click", (e) => {
  e.preventDefault();
  // console.log(arreglo);
  abanderado(arreglo);
});

function abanderado(arreglo) {
  listAbanderados.innerHTML = "";
  arreglo
    .sort(compare)
    .slice(0, 3)
    .forEach((nota) => {
      let p = document.createElement("p");
      p.className = "abanderado";
      p.textContent = `Nota: ${nota[0]}, Posicion : ${nota[1]}`;
      listAbanderados.appendChild(p);
      console.log(`Nota: ${nota[0]}, Posicion : ${nota[1]}`);
    });
}
[1, 3, 5, 2, 15, 5, 7];
