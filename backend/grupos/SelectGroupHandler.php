<?php
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$rol = $_SESSION['rol'] ?? '';
$cod_centro = $_SESSION['cod_centro'] ?? '';

// Obtener grupos según rol
if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id_user = ? ORDER BY cod_grupo");
    $stmt->execute([$_SESSION['user_id']]);
} else { // Director
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_centro = ? ORDER BY cod_grupo");
    $stmt->execute([$cod_centro]);
}

$grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Indicar si puede crear nuevo grupo
$puedeCrear = false;
if ($rol === 'Director') {
    $stmt2 = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE id_user = ?");
    $stmt2->execute([$_SESSION['user_id']]);
    $puedeCrear = $stmt2->fetchColumn() < 5; // Director puede hasta 5 grupos
}
