<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form action="index.php" method="post">
        <input name="user" type="text">
        <input name="psw" type="text">
        <input type="submit">
    </form>
<?php
include 'db.php';
session_start();
$conn = OpenCon();
    $user = $_POST['user'];
    $psw = $_POST['psw'];
    $usuarios = $conn->query("SELECT * FROM usuario WHERE nombre_usuario = '$user' AND psw = '$psw'");
    // foreach($usuario as $usuarios){

    //     printf($usuario);
    // }
    if($usuarios->num_rows != 0){
        echo "Conexion completa";
    }else{
        echo "no se conecto";
    };
// while ($row = $usuarios->fetch_assoc()) {
//     echo $row['email']."<br>";
// }
// echo "$usuarios";
CloseCon($conn);
?>
</body>
</html>