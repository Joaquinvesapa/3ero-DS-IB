elResultado = document.querySelector('.text');

let num = prompt('Ingrese un numero')
let vacio = ''

if( num.length !== 0 && !isNaN(parseInt(num))){
    const text = `El numero ingresado es: ${num}`;
    document.querySelector('.text').innerHTML = text;
    for(let i = 0; i < 11; i++){
        let row = `<tr> ${num} X ${i} = ${i*num}<tr>`
        document.getElementById('table').innerHTML += row
    }
}else{
    alert('invalido')
}

// console.log(num)
