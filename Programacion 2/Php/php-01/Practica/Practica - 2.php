<!-- 
Ejercicio 3

Cargar dos vectores con números al azar de 6 elementos cada uno. El primer
vector se llama $origen y el segundo $destino. Debe realizar una función que
informe la cantidad de elementos repetidos que hay en cada vector, y además
la posición que ocupa en ambos vectores. Un ejemplo sería:
origen contiene los elementos 1, 4, 6, 8, 12 y 17.
destino contiene los elementos 3, 6, 0, 4, 5 y 1.
La salida debería ser la siguiente:
El elemento 1 está en la posición 1 de origen y en la posición 6 de
destino
El elemento 4 está en la posición 2 de origen y en la posición 4 de
destino
El elemento 6 está en la posición 3 de origen y en la posición 2 de
destino
Se encontraron 3 repeticiones.
(código PLA-07).

Ejercicio 4

Escribir un programa en PHP que cargue en un array las notas de 30 alumnos
de un curso (hacerlo con números al azar entre 0 y 10). Luego deberá armar
una función llamada Abanderado que devolverá la nota de los 3 mejores
alumnos. Fuera de la función, deberá imprimir las 3 notas y la ubicación de
cada una dentro del array.
(código PLA-02).  
-->
    <?php
        function cargarArray(&$array, $cantEl = 6){
            for($i = 0; $i<$cantEl; $i++){
                $array[] = rand(0,10);
            }
        } 
        $origen = array();
        $destino = array();
        cargarArray($origen, 6);
        cargarArray($destino, 6);

        // var_dump($origen);
        // var_dump($destino);
        foreach($origen as $indexOrigen => $org){
            // echo "Indice : $indexOrigen, Valor: $org";
            foreach($destino as $indexDestino => $des){
                if($org == $des){
                    echo "El elemento $org está en la posición $indexOrigen de origen y en la posición $indexDestino de
                    destino<br>";
                }
            }
        }
            ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practica 2</title>
</head>
<body>
            <table border="1" style="border-collapse: collapse">
                <tr>
                    <th>Indice</th>
                    <th>Origen</th>
                    <th>Destino</th>
                </tr>
                <?php foreach($origen as $indice => $org) : ?>
                <tr>
                    <td><?php echo $indice; ?></td>
                    <td><?php echo $org; ?></td>
                    <td><?php echo $destino[$indice]; ?></td>
                </tr>
                <?php endforeach ?>
            </table>
</body>
</html>