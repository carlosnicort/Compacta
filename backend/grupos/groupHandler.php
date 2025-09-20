<?php
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
session_start();
requireAuth();

// CSRF simple
if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf_token'] ?? '')) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Token inválido']);
    exit;
}

// Recoger y validar datos
$cod_centro = $_POST['cod_centro'] ?? '';
$etapa      = $_POST['etapa'] ?? '';
$nivel      = $_POST['nivel'] ?? '';
$grupo      = $_POST['grupo'] ?? '';
$listado    = intval($_POST['listado'] ?? 0);

$allowedEtapas = ['Infantil','Primaria','ESO','Bachillerato','FP'];
if (!in_array($etapa, $allowedEtapas) || $listado < 1 || !preg_match('/^[A-H]$/', $grupo)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Datos no válidos']);
    exit;
}

// Comprobar cod_centro
$check = $pdo->prepare("SELECT 1 FROM ttCentros WHERE cod_centro = ? LIMIT 1");
$check->execute([$cod_centro]);
if (!$check->fetch()) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Centro no existe']);
    exit;
}

// Insert
$stmt = $pdo->prepare("INSERT INTO TI_Gr1 (cod_centro, etapa, Curso, Grupo, listado, id_user) VALUES (?, ?, ?, ?, ?, ?)");
try {
    $stmt->execute([$cod_centro, $etapa, $nivel, $grupo, $listado, $_SESSION['user_id']]);
    echo json_encode(['success' => true, 'message' => 'Grupo creado']);
    exit;
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error al guardar']);
    exit;
}
