<?php

$host = "localhost"; // en Windows evita "localhost" por el tema IPv6
$port = "3306";      // confirma que es 3306 en tu my.ini
$dbname = "u530590124_compacta_Educa";  // <-- pon el nombre real de tu DB
$user = "root";      // <-- el usuario de MySQL
$pass = "";   // <-- su contraseña

try {
    $pdo = new PDO(
        "mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4",
        $user,
        $pass,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    // si hay error, devuelve JSON en vez de romper
    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'DB connection error: '.$e->getMessage()]);
    exit;
}