const btn1 = document.getElementById("btn1");

btn1.addEventListener("click", function () {
  let año1 = document.getElementById("año1").value;

  function esBisiesto(año) {
    if (año % 400 === 0) {
      if (año % 100 === 0) {
        if (año % 4 === 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  if (esBisiesto(año1)) {
    document.getElementById("ans1").innerHTML = "✅";
  } else {
    document.getElementById("ans1").innerHTML = "❌";
  }
});
