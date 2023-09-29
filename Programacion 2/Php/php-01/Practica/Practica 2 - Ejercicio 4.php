<!-- 
Ejercicio 4

Escribir un programa en PHP que cargue en un array las notas de 30 alumnos
de un curso (hacerlo con números al azar entre 0 y 10). Luego deberá armar
una función llamada Abanderado que devolverá la nota de los 3 mejores
alumnos. Fuera de la función, deberá imprimir las 3 notas y la ubicación de
cada una dentro del array.
(código PLA-02).  -->
<?php
    function generarAlumnosConNotas(&$alumnos, $cant){
        for($i = 0; $i <= $cant; $i++){
            $alumnos[$i] = rand(0,10);
        }
    }
    $alumnos = array();
    generarAlumnosConNotas($alumnos, 30);
    function calcularAbanderados($alumnos){
        sort($alumnos);
        foreach($alumnos as $index => $alumno){
            echo "Alumno {$alumno} en posicion $index <br>";
        }
    }
    calcularAbanderados($alumnos);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practica 2 - Ejercicio 4</title>
</head>
<body>
    
</body>
</html>