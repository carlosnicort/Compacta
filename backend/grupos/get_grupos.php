<?php
session_start();
require_once __DIR__ . '/../../../config/db/db.php';
require_once __DIR__ . '/../../../config/auth/auth.php';
requireAuth();

$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT cod_centro, rol FROM usuarios WHERE id_user = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$user) {
    echo json_encode(['success'=>false,'message'=>'Usuario no encontrado']);
    exit;
}

$rol = $user['rol'];
$cod_centro = $user['cod_centro'];

if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id_user = ?");
    $stmt->execute([$user_id]);
} elseif ($rol === 'Director') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_centro = ?");
    $stmt->execute([$cod_centro]);
}

$grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(['success'=>true,'grupos'=>$grupos]);
