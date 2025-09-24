<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../config/db/db.php';
header('Content-Type: application/json');

try {
    $stmt = $pdo->query("SELECT cod_centro, nombre_centro FROM ttcentros ORDER BY cod_centro ASC");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC); // Array de objetos: [{cod_centro, nombre_centro}, ...]

    echo json_encode([
        'success' => true,
        'centros' => $rows
    ]);
} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error al cargar centros'
    ]);
}
?>
