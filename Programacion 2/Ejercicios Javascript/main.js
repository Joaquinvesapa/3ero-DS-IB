const ejs = [
  { title: "Ejercicio 1", desc: "" },
  { title: "Ejercicio 2", desc: "" },
  { title: "Ejercicio 3", desc: "" },
  { title: "Ejercicio 4", desc: "" },
  { title: "Ejercicio 5", desc: "" },
  { title: "Ejercicio 6", desc: "" },
  { title: "Ejercicio 7", desc: "" },
  { title: "Ejercicio 8", desc: "" },
  { title: "Ejercicio 9", desc: "" },
  { title: "Ejercicio 10", desc: "" },
  { title: "Ejercicio 11", desc: "" },
  { title: "Ejercicio 12", desc: "" },
  { title: "Ejercicio 13", desc: "" },
  { title: "Ejercicio 14", desc: "" },
];
const main = document.getElementById("main");

ejs.forEach((ej) => {
  const { title, desc } = ej;

  const card = document.createElement("div");
  card.classList = "card";

  card.innerHTML = `
    <div class="card">
      <h2>${title}</h2>
      <p>${desc}</p>
    </div>
  `;

  main.appendChild(card);
});
