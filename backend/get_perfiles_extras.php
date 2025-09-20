<?php
require_once __DIR__ . '/../config/db/db.php';

// Recoger el perfil (opcional)
$perfil = $_GET['perfil'] ?? '';

if ($perfil) {
    $stmt = $pdo->prepare("SELECT extra FROM tt_perfiles_extras WHERE perfil = ? ORDER BY extra ASC");
    $stmt->execute([$perfil]);
    $opciones = $stmt->fetchAll(PDO::FETCH_COLUMN);
} else {
    $stmt = $pdo->query("SELECT DISTINCT perfil FROM tt_perfiles_extras ORDER BY perfil ASC");
    $opciones = $stmt->fetchAll(PDO::FETCH_COLUMN);
}

header('Content-Type: application/json');
echo json_encode($opciones);
