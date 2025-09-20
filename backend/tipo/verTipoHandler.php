<?php
session_start();
require_once __DIR__ . '/../../src/db.php';
require_once __DIR__ . '/../../src/auth.php';
requireAuth();

$result = ['status' => 'error', 'message' => '', 'grupo' => [], 'alumnos' => []];

// Verificar que se reciba ID del grupo
$grupoId = $_GET['grupo'] ?? null;
if (!$grupoId) {
    $result['message'] = "Grupo no especificado.";
    return;
}

// Obtener información del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ? AND id_user = ?");
$stmt->execute([$grupoId, $_SESSION['user_id']]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    $result['message'] = "Grupo no encontrado o no tienes permisos para verlo.";
    return;
}

// Obtener alumnos asociados a este grupo
$stmt = $pdo->prepare("SELECT id, tipo_acneae FROM TI_Alumnos WHERE cod_grupo = ?");
$stmt->execute([$grupo['cod_grupo']]);
$alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);

$result['status'] = 'ok';
$result['grupo'] = $grupo;
$result['alumnos'] = $alumnos;
