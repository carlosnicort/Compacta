<?php
try {
    $pdo = new PDO("mysql:host=localhost;dbname=compacta;charset=utf8", "root", "");
    echo "Conexión exitosa 🚀";
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
?>