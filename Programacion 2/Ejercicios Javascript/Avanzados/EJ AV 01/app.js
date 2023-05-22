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

const FACTURAS = [
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
  {
    fecha: "2023-04-30",
    numCliente: "1278",
    monto: 50000,
    concepto: "Pago Cliente",
  },
];

const validarFechaCliente = (newFactura) => {
  const { numCliente: newNumberCliente } = newFactura;
  const newFecha = new Date(newFactura.fecha);

  const newMes = newFecha.getMonth();
  const newAño = newFecha.getFullYear();

  // console.log(newMes, newAño);

  // let valido = false;
  for (const factura of FACTURAS) {
    const { numCliente } = factura;

    const fecha = new Date(factura.fecha);

    const mes = fecha.getMonth();
    const año = fecha.getFullYear();

    console.log(numCliente, newNumberCliente, newMes, mes);

    // console.log(año, mes);
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

  return true;
};

btnAgregar.addEventListener("click", () => {
  let newFactura = {};
  inputs.forEach((input) => {
    // console.log(input);
    newFactura[input.name] = input.value; //agregar valores de los inputs a la nueva factura
  });
  const { error, campo } = isValid(newFactura); //validar que los campos de la factura no sean invalidos
  console.log(FACTURAS);
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
      FACTURAS.push(newFactura);
      gridFacturas.innerHTML = ""; //resetear grilla de facturas
      renderFacturas(); //renderizar facturas

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
  for (const factura of FACTURAS) {
    // console.log(FACTURAS);
    let { numCliente, fecha, monto, concepto } = factura;
    let divFactura = document.createElement("div");
    divFactura.className = "factura";
    divFactura.innerHTML = `
    <p class="num-cliente">${numCliente}</p>
    <p class="fecha">${fecha}</p>
    <p class="monto">$${monto}</p>
    <p class="concepto">${concepto.length ? concepto : "-"}</p>`;
    gridFacturas.appendChild(divFactura);
  }
};

renderFacturas();

const PROMEDIOS = [
  {
    numCliente: 1,
    prom: "450,89",
  },
  {
    numCliente: 2,
    prom: "6789,89",
  },
  {
    numCliente: 3,
    prom: "89,89",
  },
];

const renderPromedios = () => {
  for (const promedio of PROMEDIOS) {
    // console.log(FACTURAS);
    let { numCliente, prom } = promedio;
    let divPromedio = document.createElement("div");
    divPromedio.className = "promedio";
    divPromedio.innerHTML = `
    <p class="num-cliente">${numCliente}</p>
    <p class="prom">$${prom}</p>`;
    gridPromedios.appendChild(divPromedio);
  }
};

renderPromedios();
