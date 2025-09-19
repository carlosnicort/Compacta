<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

if (!isset($_GET['cod_grupo'])) {
    die("Grupo no especificado. <a href='select_group.php'>Volver a selección</a>");
}

$cod_grupo = $_GET['cod_grupo'];
$cod_centro = $_SESSION['cod_centro'] ?? '';

$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_grupo = ? AND cod_centro = ?");
$stmt->execute([$cod_grupo, $cod_centro]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    die("Grupo no encontrado. <a href='select_group.php'>Volver a selección</a>");
}

// Guardar grupo en sesión
$_SESSION['current_group'] = $cod_grupo;

header("Location: create_tipo.php");
exit();