<?php
session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

$result = ['status'=>'error','message'=>'','grupo'=>[], 'alumnos'=>[]];

$cod_grupo = $_GET['grupo'] ?? null;
if (!$cod_grupo) {
    $result['message'] = 'Grupo no especificado';
    echo json_encode($result);
    exit();
}

// Info del grupo
$stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE cod_grupo=? AND id_user=?");
$stmt->execute([$cod_grupo, $_SESSION['user_id']]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    $result['message'] = 'Grupo no encontrado o no tienes permisos';
    echo json_encode($result);
    exit();
}

// Alumnos
$stmt = $pdo->prepare("SELECT id_alu, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, OtrasObservaciones 
                       FROM ti_alu1 WHERE cod_grupo=? ORDER BY id_alu");
$stmt->execute([$cod_grupo]);
$alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);

$result['status'] = 'ok';
$result['grupo'] = $grupo;
$result['alumnos'] = $alumnos;

echo json_encode($result);
exit();
