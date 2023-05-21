/*
fecha de la factura
número de cliente (un número que puede ser de 1 a 1278)
monto de la factura
concepto de facturación

*/
const gridFacturas = document.querySelector(".facturas");
const btnAgregar = document.querySelector(".btnAgregar");
const inputs = document.querySelectorAll("input");

const FACTURAS = [
  {
    numCliente: 1278,
    fecha: "29-04-2923",
    monto: 50000,
    concepto: "Pago Cliente",
  },
];
btnAgregar.addEventListener("click", () => {
  let newFactura = {};
  inputs.forEach((input) => {
    console.log(input);
    newFactura[input.name] = input.value;
  });

  FACTURAS.push(newFactura);
  gridFacturas.innerHTML = "";
  renderFacturas();
});

const renderFacturas = () => {
  for (const factura of FACTURAS) {
    // console.log(FACTURAS);
    let { numCliente, fecha, monto, concepto } = factura;
    let divFactura = document.createElement("div");
    divFactura.className = "factura";
    divFactura.innerHTML = `
    <p class="num-cliente">${numCliente}</p>
    <p class="fecha">${fecha}</p>
    <p class="monto">${monto}</p>
    <p class="concepto">${concepto}s</p>`;
    gridFacturas.appendChild(divFactura);
  }
};

renderFacturas();
