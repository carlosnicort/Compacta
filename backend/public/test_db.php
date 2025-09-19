<?php
$host = "srv579.hstgr.io"; // o el host que te dé Hostinger (ej. mysql.hostinger.com)
$db   = "u530590124_CompactaEduca";
$user = "u530590124_cno";
$pass = "Fernando3/5?"; // cámbiala por la que tengas
try {
    $conn = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "✅ Conexión correcta a la base de datos.";
} catch (PDOException $e) {
    echo "❌ Error de conexión: " . $e->getMessage();
}
?> 