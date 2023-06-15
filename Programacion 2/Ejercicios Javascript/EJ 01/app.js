const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");

function esBisiesto(año) {
  if ((año % 4 === 0 && año % 100 != 0) || año % 400 === 0) {
    console.log("es");
    return true;
  } else {
    return false;
  }
}

btn1.addEventListener("click", function () {
  let año1 = document.getElementById("año1").value;

  if (esBisiesto(año1)) {
    document.getElementById("ans1").innerHTML = "✅";
  } else {
    document.getElementById("ans1").innerHTML = "❌";
  }
});

btn2.addEventListener("click", function () {
  let año2 = new Date(document.getElementById("año2").value).getFullYear();
  if (esBisiesto(año2)) {
    document.getElementById("ans2").innerHTML = "✅";
  } else {
    document.getElementById("ans2").innerHTML = "❌";
  }
});
