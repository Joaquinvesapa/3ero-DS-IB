/*
 * Una empresa de cable necesita un programa en Javascript que permita la carga y la estadística de la facturación mensual. Emite una factura por mes para cada cliente. Para ello cuenta con los siguientes datos por cada factura que emite: 
 
 ! => fecha de la factura

 ! => Número de cliente (un número que puede ser de 1 a 1278)

 ! => Monto de la factura, concepto de facturación.

 * El programa debe permitir la carga de todas las facturas del mes y obtener un informe que incluya: 

 TODO=> Cantidad total facturada 

 TODO=> Cantidad de clientes cuya facturación es superior a mil pesos. 
 
 TODO=> Promedio de facturación por cliente

 */
const gridFacturas = document.querySelector(".facturas");
const gridPromedios = document.querySelector(".promedios");
const btnAgregar = document.querySelector(".btnAgregar");
const inputs = document.querySelectorAll("input");
const errorEl = document.querySelector(".noti");
const pTotalFacturado = document.getElementById("total-facturado");
const pCantClientes1k = document.getElementById("cant-clientes1k");

const facturasObj = {
  // 1: [{ fecha: "2023-05-23", numCliente: "1", monto: 3899, concepto: "-" }],
};
let montosTotalesXCliente;

const validarFechaCliente = (newFactura) => {
  const { numCliente: newNumberCliente } = newFactura;
  const newFecha = new Date(newFactura.fecha);

  const newMes = newFecha.getMonth();
  const newAño = newFecha.getFullYear();
  // console.log(facturasObj, newFactura);
  // let valido = false
  for (const numCliente in facturasObj) {
    const facturas = facturasObj[numCliente]; //Extraigo las facturas almacenadas por determinado cliente

    for (const facturaCliente in facturas) {
      //al ser un array, debo iterarlo para conseguir los datos de cada factura de 1 cliente y poder compararlo con la factura entrante
      //Extraigo el numCliente y la fecha de la factura almacenada que voy a comparar
      const { numCliente } = facturas[facturaCliente];
      const fecha = new Date(facturas[facturaCliente].fecha);

      const mes = fecha.getMonth();
      const año = fecha.getFullYear();

      if (newNumberCliente === numCliente && newMes === mes && newAño === año) {
        errorEl.firstElementChild.innerHTML =
          "Este cliente ya tiene una factura este mes";
        errorEl.className = "noti error visible";
        setTimeout(() => {
          errorEl.className = "noti error not-visible";
        }, 3000);
        // valido = false;
        return false;
      }
    }
  }

  return true;
};

btnAgregar.addEventListener("click", () => {
  let newFactura = {};
  inputs.forEach((input) => {
    // console.log(input);
    newFactura[input.name] = input.value; //agregar valores de los inputs a la nueva factura
  });
  const { error, campo } = isValid(newFactura); //validar que los campos de la factura no sean invalidos
  if (error.length) {
    inputs.forEach((input) => {
      // motrar error segun el campo que este invalido
      input.name === campo
        ? (input.classList.add("input-invalid"),
          (errorEl.className = "noti error visible"),
          (errorEl.firstElementChild.innerHTML = error),
          setTimeout(() => {
            input.classList.remove("input-invalid");
            errorEl.className = "noti error not-visible";
          }, 3000))
        : null;
    });
  } else {
    //agregar facturas al arreglo general
    // console.log(validarFechaCliente(newFactura));
    if (validarFechaCliente(newFactura)) {
      if (facturasObj[newFactura.numCliente]) {
        facturasObj[newFactura.numCliente].push(newFactura);
      } else {
        facturasObj[newFactura.numCliente] = [newFactura];
      }
      gridFacturas.innerHTML = ""; //resetear grilla de facturas
      render(); //renderizar facturas

      //resetear campo
      inputs.forEach((input) => {
        input.value = "";
      });

      //motrar succes
      errorEl.firstElementChild.innerHTML = "Factura agregada correctamente";
      errorEl.className = "noti succes visible";
      setTimeout(() => {
        errorEl.className = "noti succes not-visible";
      }, 3000);
    } else {
      return;
    }
  }
});

const isValid = (factura) => {
  const { numCliente, fecha, monto } = factura;
  if (numCliente === "") {
    return {
      error: "El numero de cliente no puede ser vacio",
      campo: "numCliente",
    };
  } else if (numCliente < 0 || numCliente > 1278) {
    return {
      error: "El numero de cliente debe ser entre 1 y 1278",
      campo: "numCliente",
    };
  } else if (fecha === "") {
    return { error: "La fecha no puede estar vacia", campo: "fecha" };
  } else if (monto === "") {
    return { error: "El monto no puede estar vacio", campo: "monto" };
  } else {
    return { error: "" };
  }
};

const renderFacturas = () => {
  for (const numCliente in facturasObj) {
    facturasObj[numCliente].forEach((factura) => {
      let { fecha, monto, concepto } = factura;

      let divFactura = document.createElement("div");
      divFactura.className = "factura";
      divFactura.innerHTML = `
      <p class="num-cliente">${numCliente}</p>
      <p class="fecha">${fecha}</p>
      <p class="monto">$${monto}</p>
      <p class="concepto">${concepto.length ? concepto : "-"}</p>`;
      gridFacturas.appendChild(divFactura);
    });
  }
};
const renderPromedios = () => {
  gridPromedios.innerHTML = "";
  for (const promedio of montosTotalesXCliente) {
    let { id, montoTotal, cantFacturas } = promedio;

    let divPromedio = document.createElement("div");
    divPromedio.className = "promedio";
    divPromedio.innerHTML = `
    <p class="num-cliente">${id}</p>
    <p class="prom">$${(Number(montoTotal) / Number(cantFacturas)).toFixed(
      2
    )}</p>`;
    gridPromedios.appendChild(divPromedio);
  }
};

const calcularTotalFacturado = () => {
  pTotalFacturado.textContent = `$${montosTotalesXCliente.reduce(
    (acc, total) => (acc = Number(acc) + Number(total.montoTotal)),
    0
  )}`;

  pCantClientes1k.textContent = `${
    montosTotalesXCliente.filter((factura) => factura.montoTotal > 1000).length
  }`;
};

function calcularPromedios() {
  montosTotalesXCliente = [];

  for (id in facturasObj) {
    let montoTotal;
    montoTotal = facturasObj[id].reduce(
      (acc, total) => (acc = Number(acc) + Number(total.monto)),
      0
    );
    // console.log(montoTotal);
    montosTotalesXCliente.push({
      id,
      montoTotal,
      cantFacturas: facturasObj[id].length,
    });
  }
}

function render() {
  renderFacturas();
  calcularPromedios();
  calcularTotalFacturado();
  renderPromedios();
  // console.log(facturasObj);
}
render();
