//Inputs of numbers
// const in1 = document.getElementById("in1");
// const in2 = document.getElementById("in2");
// const in3 = document.getElementById("in3");
// const in4 = document.getElementById("in4");
// const in5 = document.getElementById("in5");
// const in6 = document.getElementById("in6");
// const in7 = document.getElementById("in7");
// const in8 = document.getElementById("in8");
// const in9 = document.getElementById("in9");
// const in0 = document.getElementById("in0");

const inputs = document.querySelectorAll("input");
const curCalculate = document.getElementById("curCalculate");

let inicio = false;

inputs.forEach(function (el) {
  el.addEventListener("click", function () {
    if (el.value === "AC") {
      curCalculate.value = "";
    } else if (el.value === "=") {
      curCalculate.value = eval(curCalculate.value);
      inicio = true;
    } else if (inicio === true) {
      if (
        el.value === "+" ||
        el.value === "-" ||
        el.value === "*" ||
        el.value === "/"
      ) {
        curCalculate.value += el.value;
        inicio = false;
      } else {
        curCalculate.value = el.value;
        inicio = false;
      }
    } else {
      curCalculate.value += el.value;
    }
  });
});
