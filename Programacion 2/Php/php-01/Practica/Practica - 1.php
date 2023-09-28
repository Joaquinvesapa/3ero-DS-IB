<!-- 
Ejercicio 1

Ingresar por medio de un programa HTML un valor entero N. Luego llamar por
el método POST a un programa PHP, que genere un vector $vec de N
elementos, el cual contenga los primeros N números naturales primos.
Realizar este procedimiento dentro de una función. Finalmente imprimir el
vector en el script original. (código PLA-04).

Ejercicio 2

La N.A.S.A. está realizando un proyecto sobre el estudio de las partículas H en
nuestro Sistema Solar. Para ello han colocado unas antenas especiales en
cada uno de los nueve planetas siguientes: Mercurio, Venus, Tierra, Marte,
Júpiter, Saturno, Urano, Neptuno y Plutón (codificados con números del 0 al 8),
distribuidas de manera uniforme a lo largo del ecuador de los mismos. Cada
antena es capaz de detectar la cantidad de partículas H que impactan sobre el
área que cubre la antena. Realizar un programa php con una función llamada
planeta_con_mas_particulasH, que recibiendo como parámetro de entrada
un array (llamado $particulas, cargarlo con nueve números que usted
desee) con el total de partículas H que han impactado en cada uno de los 9
planetas, devuelva, como valor de retorno, el número del planeta (entre 0 y 8)
donde se han detectado más partículas H. Realizar otra función llamada
planeta_con_menos_particulasH igual que la anterior, pero donde devuelva
el planeta donde se detectó menos partículas H. Por último, otra función en
donde devuelva el promedio de partículas en los 9 planetas. En el script
principal deberá imprimir:

El planeta X es donde se detectaron más partículas H.
El planeta Y es donde se detectaron menos partículas H.
El promedio de partículas H es NNNN.

(código PLA-06).  -->
<?php


function generarVector($numN){
    $vec = array();
    $contador = 0;
    while(count($vec) < $numN){
        if(esPrimo($contador)){
            $vec[] = $contador;
        };
        $contador = $contador + 1;
    };
    return ($vec);
};

function esPrimo($contador){
    for($i = 2; $i < $contador; $i++){
        if($contador % $i == 0){
            return false;
        }else{
            return true;
        };
    }
}
    if($_SERVER["REQUEST_METHOD"] == "POST"){//SI DE PARTE DEL SERVER LLEGA UN METODO POST

        $numN = $_POST["inp-number"];
        $vector = generarVector($numN);
       
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practica 1</title>
</head>
<body>
    <main>
        <div>
            <form action="" method="post">
                <label for="input-number">Inserte un número</label>
                <input id="input-number" name="inp-number" type="number" placeholder="Numero">
            </form>
            <div name="array">
                <?php
                    if(isset($vector)): 
                        foreach($vector as $valor):
                ?>
                        <p><?php echo $valor;?></p>    
                <?php 
                        endforeach;
                    endif;
                ?>
            </div>
        </div>
    </main>
</body>
</html>