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
// header('Content-Type: application/json; charset=utf-8');

// echo (json_encode($arr));
function generarPlanetas(){
    $particulas = array();
    for($i = 0; $i < 9; $i++){
        $valor = rand(0,50);
        $particulas[] = $valor;
    };
    
    return $particulas;
}
function planeta_con_mas_particulasH($particulas){
    $max = 0;
    for($i = 0; $i < 9; $i++){
        if($particulas[$max] < $particulas[$i]){
            $max = $i;
            // return $max;
        }
    }
    return $max;
}
function planeta_con_menos_particulasH($particulas){
    $min = 0;
    for($i = 0; $i < 9; $i++){
        if($particulas[$min] > $particulas[$i]){
            $min = $i;
            // return $min;
        }
    }
    return $min;
}
function promedio_particulas($particulas){
    $total = 0;
    for($i = 0; $i < 9; $i++){
        $total = $total + $particulas[$i];
    }
    return $promedio = $total / count($particulas);
}

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

$planetas = array( "Mercurio", "Venus", "Tierra", "Marte",
"Júpiter", "Saturno", "Urano", "Neptuno","Plutón");
$particulas = generarPlanetas();
if($_SERVER["REQUEST_METHOD"] == "POST"){//SI DE PARTE DEL SERVER LLEGA UN METODO POST
    if(isset($_POST["inp-number"])){
        $numN = $_POST["inp-number"];
        $vector = generarVector($numN);
    }else if(isset($_POST["inp-generar-resp"])){
        // echo $particulas;
        $iplanetaMaxPart = planeta_con_mas_particulasH($particulas);
        $iplanetaMinPart = planeta_con_menos_particulasH($particulas);
        $promedio = promedio_particulas($particulas);
    };
    
};
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
            <h2>Ejercicio 1</h2>
            <form action="" method="post">
                <label for="input-number">Inserte un número</label>
                <input id="input-number" name="inp-number" type="number" placeholder="Numero">
                <input id="input-enviar" name="inp-enviar" type="submit" value="Enviar">
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
        <div>
            <h2>Ejercicio 2</h2>
            <form method="post">
                <!-- <input type="submit" name="inp-planetas" value="Generar numero automaticamente"> -->
                <!-- <input type="submit" name="inp-max-particulas" value="Planeta con max Particulas"> -->
                <input type="submit" name="inp-generar-resp" value="Calcular">
            </form>
            <div>
                <?php if(isset($iplanetaMaxPart) && isset($iplanetaMinPart)):?>
                <strong>El planeta <?php echo $planetas[$iplanetaMaxPart] ?> es donde se detectaron más partículas H</strong>
                <strong>El planeta <?php echo $planetas[$iplanetaMinPart] ?> es donde se detectaron menos partículas H</strong>
                <strong>El promedio de partículas H es <?php echo round($promedio) ?></strong>
                <?php endif ?>
            </div>
            <div>
                <?php if(isset($particulas) && isset($planetas)) :?>
                    <?php for($i = 0; $i < 9; $i++) : ?>
                        <strong><?php echo $planetas[$i]; ?> : </strong><p><?php echo $particulas[$i]; ?></p>
                    <?php endfor ?>
                <?php endif ?>
            </div>
        </div>
    </main>
</body>
</html>