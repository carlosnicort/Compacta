<?php
$host = "127.0.0.1";
$db   = "u530590124_compacta_educa";
$user = "root";
$pass = "";
$charset = "utf8";

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass);
    echo "Conexión OK";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}