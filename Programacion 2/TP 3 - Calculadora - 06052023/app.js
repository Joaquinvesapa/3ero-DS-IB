const input1 = document.getElementById("input1");
const curCalculate = document.getElementById("curCalculate");

input1.addEventListener("click", function () {
  curCalculate.value += input1.value;
});
