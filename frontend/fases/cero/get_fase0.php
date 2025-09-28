<?php
if (session_status() === PHP_SESSION_NONE) session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/../../../config/db/db.php';
require_once __DIR__ . '/../../../config/auth/auth.php';
requireAuth();

$id_alu = $_SESSION['current_id_alu'] ?? null;
if (!$id_alu) {
    echo json_encode([
        'success' => false,
        'message' => 'No hay alumno seleccionado en la sesión'
    ]);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM ti_fase0 WHERE id_alu = ?");
$stmt->execute([$id_alu]);
$fase0 = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$fase0) {
    // Si no hay registro, devolvemos valores vacíos
    $fase0 = [
        'id_alu'   => $id_alu,
        'form_f'   => '{}',
        'form_mp'  => '{}',
        'form_oi'  => '{}',
        'form_r1'  => '{}',
        'form_r2'  => '{}',
        'form_r3'  => '{}',
        'form_r4'  => '{}',
        'completado' => 0
    ];
}

echo json_encode([
    'success' => true,
    'data' => $fase0
]);
exit;
