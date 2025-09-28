<?php
// backend/fases/save_fase0.php
session_start();
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$input = json_decode(file_get_contents('php://input'), true);

// Depuración: ¿Qué JSON llega?
if ($input === null) {
    echo json_encode([
        'success' => false,
        'message' => 'No se ha recibido JSON válido.',
        'raw' => file_get_contents('php://input')
    ]);
    exit;
}

$id_alu = $input['id_alu'] ?? null;
$formulario = $input['formulario'] ?? null;
$selecciones = $input['selecciones'] ?? null;

if (!$id_alu || !$formulario || !is_array($selecciones)) {
    echo json_encode(['success'=>false, 'message'=>'Faltan parámetros.']);
    exit;
}

try {
    $pdo->beginTransaction();

    // 1️⃣ Comprobar si el alumno existe en ti_fase0
    $stmtCheck = $pdo->prepare("SELECT 1 FROM ti_fase0 WHERE id_alu = ?");
    $stmtCheck->execute([$id_alu]);
    if (!$stmtCheck->fetchColumn()) {
        $stmtIns = $pdo->prepare("INSERT INTO ti_fase0 (id_alu) VALUES (?)");
        $stmtIns->execute([$id_alu]);
    }

    // 2️⃣ Insertar/actualizar respuestas
    $stmtResp = $pdo->prepare("
        INSERT INTO ti_fase0_respuestas (id_alu, id_checkbox, seleccionado)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE seleccionado = VALUES(seleccionado)
    ");

    foreach ($selecciones as $id_checkbox => $valor) {
        $stmtResp->execute([$id_alu, $id_checkbox, $valor ? 1 : 0]);
    }

    $pdo->commit();

    echo json_encode(['success' => true, 'message' => 'Respuestas guardadas correctamente.']);
} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
