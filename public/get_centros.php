<?php
require_once __DIR__ . '/../src/db.php';

// Leer parámetro de búsqueda (opcional)
$term = $_GET['term'] ?? '';

$stmt = $pdo->prepare("SELECT cod_centro, nombre_centro 
                       FROM ttCentros 
                       WHERE cod_centro LIKE ? 
                       ORDER BY cod_centro ASC 
                       LIMIT 10");
$stmt->execute(["%$term%"]);
$centros = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Devolver JSON
header('Content-Type: application/json');
echo json_encode($centros);
