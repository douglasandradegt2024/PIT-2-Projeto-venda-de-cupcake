<?php
    $hostname = "localhost";
    $bd = "cakes_gourmet";
    $usuario = "cakes_gourmet";
    $senha = "qwe123";

    $conn = new mysqli($hostname, $usuario, $senha, $bd);
    
    if ($conn->connect_errno){
        echo "Falha ao conectar: " . $conn->connect_errno . ") " . $conn->connect_error;
    }
?>