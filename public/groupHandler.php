<?php
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/auth.php';
session_start();
if (empty($_SESSION['user_id'])) { header('Location: /index.php'); exit; }

// CSRF simple
if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf_token'] ?? '')) {
  http_response_code(400); echo "Token inválido"; exit;
}

// Validaciones
$cod_centro = $_POST['cod_centro'] ?? '';
$etapa = $_POST['etapa'] ?? '';
$nivel = $_POST['nivel'] ?? '';
$grupo = $_POST['grupo'] ?? '';
$listado = intval($_POST['listado'] ?? 0);

$allowedEtapas = ['Infantil','Primaria','ESO','Bachillerato','FP'];
if (!in_array($etapa, $allowedEtapas) || $listado < 1 || !preg_match('/^[A-H]$/', $grupo)) {
  http_response_code(400); echo "Datos no válidos"; exit;
}

// Opcional: comprobar que cod_centro existe
$check = $pdo->prepare("SELECT 1 FROM centros WHERE cod_centro = ? LIMIT 1");
$check->execute([$cod_centro]);
if (!$check->fetch()) {
  http_response_code(400); echo "Centro no existe"; exit;
}

// Insert
$stmt = $pdo->prepare("INSERT INTO grupos (cod_centro, etapa, nivel, grupo, listado, creado_por) VALUES (?, ?, ?, ?, ?, ?)");
try {
  $stmt->execute([$cod_centro, $etapa, $nivel, $grupo, $listado, $_SESSION['user_id']]);
  header('Location: /public/dashboard.php?msg=grupo_creado'); exit;
} catch (PDOException $e) {
  http_response_code(500); echo "Error al guardar"; exit;
}
